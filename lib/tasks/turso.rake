namespace :turso do
  desc "Sync embedded replica from remote Turso database before running migrations"
  task sync: :environment do
    if Rails.env.production?
      config = ActiveRecord::Base.connection_db_config.configuration_hash
      puts "Turso: syncing embedded replica from remote..."
      db = Libsql::Database.new(config.transform_keys(&:to_sym))
      result = db.sync
      puts "Turso: sync complete (frames_synced: #{result[:frames_synced]})"
      db.close
    else
      puts "Turso: skipping sync (not production)"
    end
  end
end

# Ensure turso:sync runs before db:migrate in production
Rake::Task['db:migrate'].enhance(['turso:sync']) if Rails.env.production?
