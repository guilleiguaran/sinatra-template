require "rubygems"
require "bundler"
require "yaml"

Bundler.require(:default, :test)

task :default => :help

Dir['tasks/*.rake'].each { |task| load task }

task :console do
  puts "Loading development console..."
  system("irb -r enviroment.rb")
end

task :help do
  puts "Available rake tasks: "
  puts "rake console - Run a IRB console with all enviroment loaded"
  puts "rake spec - Run specs"
  puts "rake rcov - Run specs and calculate coverage"
  puts "rake db:reset - Reset database"
  puts "rake db:testseed - Seed database with test data"
end