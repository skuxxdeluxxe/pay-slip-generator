require 'rubygems/package_task'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: %i[spec rubocop]

desc 'Run Rubocop on the compatible files'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = FileList[
    'spec/**/*.rb',
    'lib/**/*.rb',
    'bin/**/*',
    'Rakefile',
    'Gemfile',
  ].exclude(
    'spec/fixtures/**/*'
  )
  task.formatters = ['simple']
  task.options = ['-d']
  task.fail_on_error = true
end
