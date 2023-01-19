# frozen_string_literal: true

module Hemo
  # Defines application routes.
  class Routes < Hanami::Routes
    slice(:health, at: "/up") { root to: "show" }
    slice(:home, at: "/") { root to: "show" }

    slice :tasks, at: "/tasks" do
      root to: "index"

      get "/:id", to: "show", as: :show
      get "/new", to: "new", as: :new
      post "/", to: "create", as: :create
      get "/:id/edit", to: "edit", as: :edit
      patch "/:id", to: "patch", as: :patch
      put "/:id", to: "update", as: :update
      delete "/:id", to: "delete", as: :delete
    end

    use Rack::Static, root: "public", urls: ["/.well-known/security.txt"]
  end
end
