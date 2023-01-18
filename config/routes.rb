# frozen_string_literal: true

module Hemo
  # Defines application routes.
  class Routes < Hanami::Routes
    slice(:health, at: "/up") { root to: "show" }

    slice :main, at: "/" do
      root to: "home.show"
    end
  end
end
