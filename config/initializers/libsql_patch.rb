# Monkey-patch to fix turso_libsql gem bug where disable_read_your_writes
# is always set to true due to Ruby operator precedence.
#
# Bug in turso_libsql v0.2.1 at lib/libsql.rb line 556:
#   desc[:disable_read_your_writes] = !options[:read_your_writes] || true
# This evaluates as (!options[:read_your_writes]) || true => always true.
#
# This patch corrects it so read_your_writes: true in database.yml works.
require 'libsql'

# Suppress stderr from the turso_libsql Rust FFI library in production.
# The Rust code has dbg! macros that leak auth_token on connection init
# (src/lib.rs:281) and dump every SQL query (src/lib.rs:628).
if Rails.env.production?
  STDERR.reopen(File.open(File::NULL, 'w'))
end

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

      @inner = CLibsql::Database.init desc

      return unless block_given?

      begin yield self ensure close end
    end
  end
end
