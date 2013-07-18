require 'cucumber'
require 'cucumber/rake/task'

namespace :mode do
  Cucumber::Rake::Task.new(:headless) do |t|
    t.profile = 'headless'
  end

  Cucumber::Rake::Task.new(:default) do |t|
    t.profile = 'default'
  end

  task :ci => [:headless]
end

task :default => :default
