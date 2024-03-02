# frozen_string_literal: true

module Hemo
  # Defines application settings.
  class Settings < Hanami::Settings
    setting :database_url, constructor: Types::Params::String
  end
end
