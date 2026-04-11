namespace :turso do
  desc "Verify Turso database connection before running migrations"
  task verify: :environment do
    if Rails.env.production?
      puts "Turso: verifying remote database connection..."
      config = ActiveRecord::Base.connection_db_config.configuration_hash.transform_keys(&:to_sym)
      config[:url] = config[:host] if config[:host] && !config[:url]
      db = Libsql::Database.new(config)
      db.connect do |conn|
        conn.query("SELECT 1") { |rows| rows.next }
      end
      puts "Turso: connection verified"
      db.close
    end
  end
end

Rake::Task['db:migrate'].enhance(['turso:verify']) if Rails.env.production?
