class Application < Sinatra::Application

  configure do
    set :sessions, true
    set :views, File.join(File.dirname(__FILE__), 'views')
    set :public, File.join(File.dirname(__FILE__), 'public')
    Mongoid.configure do |config|
      conn = Mongo::Connection.from_uri(ENV['MONGO_URL'])
      uri = URI.parse(ENV['MONGO_URL'])
      config.master = conn.db(uri.path.gsub(/^\//, ''))
    end
  end

  Dir['models/*.rb'].each { |model| require model }
  Dir['controllers/*.rb'].each { |controller| load controller }

  get '/' do
    "Sinatra server working ok"
  end

  helpers do

  end

end
