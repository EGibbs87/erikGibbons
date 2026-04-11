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

# Fix 2: pragma_table_list doesn't work over remote Hrana connections.
# Override to use sqlite_master which works for both local and remote.
module ActiveRecord
  module ConnectionAdapters
    class LibsqlAdapter < AbstractAdapter
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
