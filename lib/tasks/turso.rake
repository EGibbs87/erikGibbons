namespace :turso do
  desc "Sync embedded replica from remote Turso database before running migrations"
  task sync: :environment do
    if Rails.env.production?
      config = ActiveRecord::Base.connection_db_config.configuration_hash.transform_keys(&:to_sym)
      config[:url] = config[:host] if config[:host] && !config[:url]
      puts "Turso: syncing embedded replica from remote..."
      db = Libsql::Database.new(config)
      result = db.sync
      puts "Turso: sync complete (frames_synced: #{result[:frames_synced]}, frame_no: #{result[:frame_no]})"

      # Verify synced data
      db.connect do |conn|
        conn.query("SELECT name FROM sqlite_master WHERE type='table'") do |rows|
          tables = rows.map { |r| r["name"] }
          puts "Turso: tables after sync: #{tables.join(', ')}"
        end

        conn.query("SELECT COUNT(*) as cnt FROM schema_migrations") do |rows|
          row = rows.next
          puts "Turso: schema_migrations count: #{row['cnt']}" if row
        end rescue puts "Turso: schema_migrations table not found"

        conn.query("SELECT COUNT(*) as cnt FROM tmdb_imdb_mappings") do |rows|
          row = rows.next
          puts "Turso: tmdb_imdb_mappings count: #{row['cnt']}" if row
        end rescue puts "Turso: tmdb_imdb_mappings table not found"
      end

      db.close
    else
      puts "Turso: skipping sync (not production)"
    end
  end
end

# Ensure turso:sync runs before db:migrate in production
Rake::Task['db:migrate'].enhance(['turso:sync']) if Rails.env.production?
