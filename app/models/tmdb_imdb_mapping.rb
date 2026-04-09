class TmdbImdbMapping < ApplicationRecord
    def self.imdb_for(agent, tmdb_id:, show_id:, season:, episode:)
        row = find_or_create_by!(tmdb_episode_id: tmdb_id) do |r|
            url = "https://api.themoviedb.org/3/tv/#{show_id}/season/#{season}/episode/#{episode}/external_ids?api_key=#{ENV['TMDB_API_KEY']}"
            r.imdb_id = JSON.parse(agent.get(url).body)['imdb_id']
        end
        row.imdb_id
    end
end