require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rspec) do |t|
  t.pattern = "spec/**/*_spec.rb"
end

task :default => :rspec

begin
  if Gem::Specification::find_by_name('puppet-lint')
    require 'puppet-lint/tasks/puppet-lint'
    PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]
    task :default => [:rspec, :lint]
  end
rescue Gem::LoadError
end
