ENV["RACK_ENV"] ||= "development" unless ENV["RACK_ENV"]
AppConfig = YAML.load_file(File.join(Dir.pwd, 'app_config.yml'))[ENV['RACK_ENV']]
ENV["MONGO_URL"] ||= ENV["MONGOHQ_URL"] || AppConfig['mongo_url']

require File.join(File.dirname(__FILE__), '..', 'application.rb')

namespace :db do
  desc 'Reset database'
  task :reset do
    puts "Database reset done"
  end

  desc 'Seed database with data'
  task :seed => :reset do
    puts "Database seed done"
  end
end
