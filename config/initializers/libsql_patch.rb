# Monkey-patch to fix turso_libsql gem bug where disable_read_your_writes
# is always set to true due to Ruby operator precedence.
#
# Bug in turso_libsql v0.2.1 at lib/libsql.rb line 556:
#   desc[:disable_read_your_writes] = !options[:read_your_writes] || true
# This evaluates as (!options[:read_your_writes]) || true => always true.
#
# This patch corrects it so read_your_writes: true in database.yml works.
require 'libsql'

module Libsql
  class Database
    def initialize(options = {})
      desc = CLibsql::DatabaseDesc.new

      %i[path url auth_token encryption_key].each do |sym|
        desc[sym] = FFI::MemoryPointer.from_string options[sym] unless options[sym].nil?
      end

      desc[:sync_interval] = options[:sync_interval] || 0
      desc[:disable_read_your_writes] = options[:read_your_writes] ? false : true
      desc[:synced] = true

      # Suppress stderr only during Database.init to prevent the Rust library
      # from leaking auth_token via dbg! macro at src/lib.rs:281
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
