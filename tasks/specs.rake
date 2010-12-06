begin
  require 'spec/rake/spectask'
rescue LoadError
  task(:spec) { $stderr.puts '`gem install rspec` to run specs' }
else
  desc "Run specs"
  Spec::Rake::SpecTask.new(:spec) do |spec|
    #spec.libs << 'lib' << 'spec'
    spec.spec_files = FileList['spec/**/*_spec.rb'] - FileList['spec/fixtures/**/*_spec.rb']
    spec.spec_opts = %w(--color -b -fn -R)
    # spec.warning = true
  end
  
  desc "Run specs with coverage"
  Spec::Rake::SpecTask.new(:rcov) do |spec|
    # spec.libs << 'lib' << 'spec'
    spec.spec_files = FileList['spec/**/*_spec.rb'] - FileList['spec/fixtures/**/*_spec.rb'] - FileList['vendor/**/*.rb']
    spec.spec_opts = %w(--color -b -fn -R)
    # spec.warning = true
    spec.rcov = true
    spec.rcov_opts = ['--exclude', 'spec', '--exclude', 'gems']
  end
end