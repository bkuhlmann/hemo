# frozen_string_literal: true

require "bundler/setup"
require "git/lint/rake/register"
require "hanami/rake_tasks"
require "reek/rake/task"
require "rspec/core/rake_task"
require "rubocop/rake_task"

Git::Lint::Rake::Register.call
Reek::Rake::Task.new
RSpec::Core::RakeTask.new
RuboCop::RakeTask.new

desc "Run code quality checks"
task code_quality: %i[git_lint reek rubocop]

task default: %i[code_quality spec]
