# Force an explicit sync from the remote Turso database when the app boots.
# The build-step sync (turso.rake) writes to db/production.sqlite3, but the
# runtime may create a fresh embedded replica. This ensures it has all data.
if Rails.env.production?
  Rails.application.config.after_initialize do
    begin
      config = ActiveRecord::Base.connection_db_config.configuration_hash.transform_keys(&:to_sym)
      config[:url] = config[:host] if config[:host] && !config[:url]
      db = Libsql::Database.new(config)
      result = db.sync
      puts "Turso: runtime boot sync complete (frames_synced: #{result[:frames_synced]})"
      db.close
    rescue => e
      puts "Turso: runtime boot sync failed: #{e.message}"
    end
  end
end
