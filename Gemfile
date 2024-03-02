# frozen_string_literal: true

ruby file: ".ruby-version"

source "https://rubygems.org"

gem "dry-types", "~> 1.7"
gem "hanami", "~> 2.1"
gem "hanami-assets", "~> 2.1"
gem "hanami-cli", "~> 2.1"
gem "hanami-controller", "~> 2.1"
gem "hanami-router", "~> 2.1"
gem "hanami-utils", "~> 2.1"
gem "hanami-validations", "~> 2.1"
gem "hanami-view", "~> 2.1"
gem "htmx", "~> 1.0"
gem "pg", "~> 1.5"
gem "puma", "~> 6.4"
gem "rack-attack", "~> 6.7"
gem "refinements", "~> 12.1"
gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"
gem "sequel", "~> 5.77"

group :quality do
  gem "caliber", "~> 0.51"
  gem "git-lint", "~> 7.1"
  gem "reek", "~> 6.3", require: false
  gem "rubocop-sequel", "~> 0.3"
  gem "simplecov", "~> 0.22", require: false
end

group :development, :test do
  gem "dotenv", "~> 3.0"
end

group :development do
  gem "hanami-webconsole", "~> 2.1"
  gem "localhost", "~> 1.2"
  gem "rake", "~> 13.1"
  gem "rerun", "~> 0.14"
end

group :test do
  gem "capybara", "~> 3.40"
  gem "cuprite", "~> 0.15"
  gem "database_cleaner-sequel", "~> 2.0"
  gem "guard-rspec", "~> 4.7", require: false
  gem "launchy", "~> 3.0"
  gem "rack-test", "~> 2.1"
  gem "rom-factory", "~> 0.12"
  gem "rspec", "~> 3.13"
end

group :tools do
  gem "amazing_print", "~> 1.6"
  gem "debug", "~> 1.9"
  gem "repl_type_completor", "~> 0.1"
end
