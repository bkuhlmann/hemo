# frozen_string_literal: true

require "hanami"
require "rack/attack"

module Hemo
  # Defines global application configuration.
  class App < Hanami::App
    Dry::Schema.load_extensions :monads
    Dry::Validation.load_extensions :monads

    config.actions.content_security_policy[:script_src] = "'self' 'unsafe-eval'"

    Rack::Attack.safelist("allow localhost") { |request| %w[127.0.0.1 ::1].include? request.ip }
    Rack::Attack.throttle("requests by IP", limit: 100, period: 60, &:ip)

    config.middleware.use Rack::Attack
    config.middleware.use Rack::Deflater
    config.middleware.use Rack::Static, {urls: %w[/stylesheets /javascripts], root: "public"}

    environment :development do
      config.logger.options[:colorize] = true

      config.logger = config.logger.instance.add_backend(
        colorize: false,
        stream: Hanami.app.root.join("log/development.log")
      )
    end
  end
end
