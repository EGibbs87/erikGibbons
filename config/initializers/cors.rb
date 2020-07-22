Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://ng2-tv-charts.erikgibbons.com' # production server
    resource '*', headers: :any, methods: [:get, :post, :put, :patch]
  end  

  allow do
    origins 'localhost:4200' # development server
    resource '*', headers: :any, methods: [:get, :post, :put, :patch]
  end
end