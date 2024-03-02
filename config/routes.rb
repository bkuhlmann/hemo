# frozen_string_literal: true

module Hemo
  # Defines application routes.
  class Routes < Hanami::Routes
    slice(:health, at: "/up") { root to: "show" }
    slice(:home, at: "/") { root to: "show" }

    use Rack::Static, root: "public", urls: ["/.well-known/security.txt"]
  end
end
