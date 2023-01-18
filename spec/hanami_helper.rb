# frozen_string_literal: true

require "capybara/cuprite"
require "capybara/rspec"
require "database_cleaner/sequel"
require "rack/test"
require "spec_helper"

ENV["HANAMI_ENV"] = "test"

require "hanami/prepare"
require_relative "support/database"
require_relative "support/factory"

using Refinements::Pathnames

Capybara.app = Hanami.app
Capybara.server = :puma, {Silent: true}
Capybara.javascript_driver = :cuprite
Capybara.save_path = Hanami.app.root.join "tmp/capybara"
Capybara.register_driver :cuprite do |app|
  Capybara::Cuprite::Driver.new app, window_size: [1200, 800]
end

DatabaseCleaner[:sequel].strategy = :transaction

Pathname.require_tree SPEC_ROOT, "support/factories/**/*.rb"

RSpec.configure do |config|
  config.include Capybara::DSL, Capybara::RSpecMatchers, :web
  config.include Rack::Test::Methods, type: :request
  config.include Test::Database, :db
  config.include_context "with Hanami application", type: :request

  config.before :suite do
    Hanami.app.start :persistence
    DatabaseCleaner[:sequel].clean_with :truncation
  end

  config.prepend_before :each, :db do |example|
    DatabaseCleaner[:sequel].strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner[:sequel].start
  end

  config.append_after(:each, :db) { DatabaseCleaner[:sequel].clean }
end
