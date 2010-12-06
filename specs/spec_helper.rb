require 'yaml'

ENV['RACK_ENV'] = "test"
AppConfig = YAML.load_file(File.join(Dir.pwd, 'app_config.yml'))[ENV['RACK_ENV']]
ENV["MONGOHQ_URL"] |= AppConfig['mongo_url']

require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), '..', 'application')
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false