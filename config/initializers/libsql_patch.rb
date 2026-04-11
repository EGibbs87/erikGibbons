# Monkey-patch Libsql::Database to suppress auth_token leak from
# turso_libsql Rust library's dbg! macro at src/lib.rs:281
require 'libsql'

module Libsql
  class Database
    def initialize(options = {})
      desc = CLibsql::DatabaseDesc.new

      %i[path url auth_token encryption_key].each do |sym|
        desc[sym] = FFI::MemoryPointer.from_string options[sym] unless options[sym].nil?
      end

      desc[:sync_interval] = options[:sync_interval] || 0
      desc[:disable_read_your_writes] = !options.fetch(:read_your_writes, false)

      # Suppress stderr during Database.init to prevent the Rust library
      # from leaking auth_token via dbg! macro
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
