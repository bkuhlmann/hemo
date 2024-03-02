# frozen_string_literal: true

module Test
  # Provides convenience methods for testing purposes.
  module Database
    def self.relations = rom.relations

    def self.rom = Hanami.app["persistence.rom"]

    def self.db = Hanami.app["persistence.db"]
  end
end
