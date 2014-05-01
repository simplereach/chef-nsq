require 'foodcritic'
require 'rubocop/rake_task'

FoodCritic::Rake::LintTask.new do |t|
  t.options = { fail_tags: ['any'] }
end

Rubocop::RakeTask.new

task test: [:foodcritic, :rubocop]
task default: [:test]
