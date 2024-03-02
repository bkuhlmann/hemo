# frozen_string_literal: true

require "hanami"

require_relative "initializers/rack_attack"

module Hemo
  # Defines global application configuration.
  class App < Hanami::App
    RubyVM::YJIT.enable
    Dry::Schema.load_extensions :monads
    Dry::Validation.load_extensions :monads

    config.actions.content_security_policy.then do |csp|
      csp[:manifest_src] = "'self'"
      csp[:script_src] += " 'unsafe-eval' 'unsafe-inline' https://unpkg.com/"
    end

    config.middleware.use Rack::Attack
    config.middleware.use Rack::Deflater

    environment :development do
      # :nocov:
      config.logger.options[:colorize] = true

      config.logger = config.logger.instance.add_backend(
        colorize: false,
        stream: root.join("log/development.log")
      )
    end
  end
end
