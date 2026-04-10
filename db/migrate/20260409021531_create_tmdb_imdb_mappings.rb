class CreateTmdbImdbMappings < ActiveRecord::Migration[8.0]
  def change
    create_table :tmdb_imdb_mappings do |t|
      t.integer :tmdb_episode_id
      t.string :imdb_id

      t.timestamps
    end

    add_index :tmdb_imdb_mappings, :tmdb_episode_id, unique: true
  end
end
