require "rubygems"
require "bundler"
ENV["RACK_ENV"] ||= "development" unless ENV["RACK_ENV"]
AppConfig = YAML.load_file(File.join(File.dirname(__FILE__),'app_config.yml'))[ENV['RACK_ENV']]
ENV["MONGOHQ_URL"] ||= AppConfig['mongo_url'] unless ENV["MONGOHQ_URL"]

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require "application"
run Application.new