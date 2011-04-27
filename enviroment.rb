require "rubygems"
require "bundler"
require "yaml"

ENV["RACK_ENV"] ||= "development"
AppConfig = YAML.load_file(File.join(File.dirname(__FILE__),'app_config.yml'))[ENV['RACK_ENV']]
ENV["MONGOH_URL"] ||= ENV["MONGOHQ_URL"] || AppConfig['mongo_url']

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require File.join(File.dirname(__FILE__), 'application.rb')
