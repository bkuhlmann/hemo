# frozen_string_literal: true

ruby file: ".ruby-version"

source "https://rubygems.org"

gem "dry-monads", "~> 1.9"
gem "dry-schema", "~> 1.13"
gem "dry-types", "~> 1.7"
gem "dry-validation", "~> 1.10"
gem "hanami", "~> 2.2.0"
gem "hanami-assets", "~> 2.2.0"
gem "hanami-cli", "~> 2.2.0"
gem "hanami-controller", "~> 2.2.0"
gem "hanami-db", "~> 2.2.0"
gem "hanami-router", "~> 2.2.0"
gem "hanami-validations", "~> 2.2.0"
gem "hanami-view", "~> 2.2.0"
gem "htmx", "~> 2.0"
gem "pg", "~> 1.6", force_ruby_platform: true
gem "puma", "~> 7.0"
gem "rack-attack", "~> 6.7"
gem "refinements", "~> 13.5"
gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"
gem "sequel", "~> 5.77"

group :quality do
  gem "caliber", "~> 0.82"
  gem "git-lint", "~> 9.0"
  gem "reek", "~> 6.5", require: false
  gem "rubocop-sequel", "~> 0.4"
  gem "simplecov", "~> 0.22", require: false
end

group :development, :test do
  gem "dotenv", "~> 3.0"
end

group :development do
  gem "hanami-webconsole", "~> 2.2.0"
  gem "localhost", "~> 1.2"
  gem "rake", "~> 13.3"
  gem "rerun", "~> 0.14"
end

group :test do
  gem "capybara", "~> 3.40"
  gem "cuprite", "~> 0.15"
  gem "database_cleaner-sequel", "~> 2.0"
  gem "launchy", "~> 3.0"
  gem "rack-test", "~> 2.1"
  gem "rom-factory", "~> 0.12"
  gem "rspec", "~> 3.13"
end

group :tools do
  gem "amazing_print", "~> 2.0"
  gem "debug", "~> 1.11"
  gem "irb-kit", "~> 1.1"
  gem "repl_type_completor", "~> 0.1"
end
