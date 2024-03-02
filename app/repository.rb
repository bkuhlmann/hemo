# auto_register: false
# frozen_string_literal: true

require "rom-repository"

module Hemo
  # The application repository.
  class Repository < ROM::Repository::Root
    include Deps[container: "persistence.rom"]
  end
end
