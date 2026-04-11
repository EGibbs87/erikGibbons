# Monkey-patches for turso_libsql and libsql_activerecord gems
require 'libsql'

# Fix 1: Suppress auth_token leak from Rust dbg! macro at src/lib.rs:281
module Libsql
  class Database
    def initialize(options = {})
      desc = CLibsql::DatabaseDesc.new

      %i[path url auth_token encryption_key].each do |sym|
        desc[sym] = FFI::MemoryPointer.from_string options[sym] unless options[sym].nil?
      end

      desc[:sync_interval] = options[:sync_interval] || 0
      desc[:disable_read_your_writes] = !options.fetch(:read_your_writes, false)

      orig_stderr = STDERR.dup
      STDERR.reopen(File.open(File::NULL, 'w'))
      begin
        @inner = CLibsql::Database.init desc
      ensure
        STDERR.reopen(orig_stderr)
        orig_stderr.close
      end

      return unless block_given?

      begin yield self ensure close end
    end
  end
end

# Fix 2: The adapter uses stmt.column_count to decide between query (read)
# and execute (write) paths. Over remote Hrana connections, column_count
# returns 0 for SELECT/PRAGMA statements against system tables, causing
# them to be treated as writes and returning empty results.
# This breaks table detection, migrations, and schema checks.
#
# Also fixes pragma_table_list not working over Hrana by using sqlite_master.
module ActiveRecord
  module ConnectionAdapters
    class LibsqlAdapter < AbstractAdapter
      def perform_query(
        raw_connection, sql, binds, type_casted_binds, prepare:,
        notification_payload:, batch: false
      )
        _ = prepare
        _ = notification_payload
        _ = binds

        if batch
          raw_connection.execute_batch(sql)
        else
          stmt = raw_connection.prepare(sql)
          begin
            # Force SELECT/PRAGMA/WITH statements through the query path,
            # regardless of column_count (which is unreliable over Hrana)
            is_read = sql.match?(/\A\s*(SELECT|PRAGMA|WITH)\b/i)

            result =
              if !is_read && stmt.column_count.zero?
                @last_affected_rows = stmt.execute type_casted_binds
                ActiveRecord::Result.empty
              else
                rows = stmt.query(type_casted_binds)
                @last_affected_rows = nil
                ActiveRecord::Result.new(rows.columns, rows.to_a.map(&:values))
              end
          ensure
            stmt.close
          end
        end
        verified!

        result
      end

      def data_source_sql(name = nil, type: nil)
        scope = quoted_scope(name, type:)
        scope[:type] ||= "'table','view'"

        sql = +"SELECT name FROM sqlite_master WHERE 1=1"
        sql << " AND name = #{scope[:name]}" if scope[:name]
        sql << " AND type IN (#{scope[:type]})"
        sql
      end
    end
  end
end
