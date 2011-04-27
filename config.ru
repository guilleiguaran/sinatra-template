require "rubygems"
require "bundler"
ENV["RACK_ENV"] ||= "development"
AppConfig = YAML.load_file(File.join(File.dirname(__FILE__),'app_config.yml'))[ENV['RACK_ENV']]
ENV["MONGO_URL"] ||= ENV["MONGOHQ_URL"] || AppConfig['mongo_url']

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require "application"
run Application.new
