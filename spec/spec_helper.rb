ENV['RACK_ENV'] = "test"

require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), '..', 'application')
require 'rspec'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

class SessionData
  def initialize(cookies)
    @cookies = cookies
    @data = cookies['rack.session']
    if @data
      @data = @data.unpack("m*").first
      @data = Marshal.load(@data)
    else
      @data = {}
    end
  end

  def [](key)
    @data[key]
  end

  def []=(key, value)
    @data[key] = value
    session_data = Marshal.dump(@data)
    session_data = [session_data].pack("m*")
    @cookies.merge("rack.session=#{Rack::Utils.escape(session_data)}", URI.parse("//example.org//"))
    raise "session variable not set" unless @cookies['rack.session'] == session_data
  end
end

def session
  SessionData.new(rack_test_session.instance_variable_get(:@rack_mock_session).cookie_jar)
end
