# frozen_string_literal: true

require "rom-factory"
require_relative "database"

module Test
  Factory = ROM::Factory.configure { |config| config.rom = Test::Database.rom }
end
