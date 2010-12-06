class Application < Sinatra::Application
  
  configure do
    MongoMapper.config = { ENV['RACK_ENV'] => {'uri' => ENV['MONGOHQ_URL'] } }
    MongoMapper.connect(ENV['RACK_ENV'])
    AppConfig = YAML.load_file(File.join(Dir.pwd, 'app_config.yml'))[ENV['RACK_ENV']] unless AppConfig
    
    set :sessions, true
    set :views, File.join(File.dirname(__FILE__), 'views')
    set :public, File.join(File.dirname(__FILE__), 'public')
  end
  
  Dir['models/*.rb'].each { |model| require model }
  Dir['controllers/*.rb'].each { |controller| load controller }
  
  get '/' do
    "Sinatra server working ok"
  end

end