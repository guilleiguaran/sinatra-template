require 'rspec/core/rake_task'

desc "Run specs"
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = '../spec/**/*_spec.rb'
  end
end
