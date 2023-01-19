# frozen_string_literal: true

module Hemo
  # Defines application routes.
  class Routes < Hanami::Routes
    slice(:health, at: "/up") { root to: "show" }

    slice :main, at: "/" do
      root to: "tasks.index"

      get "/tasks", to: "tasks.index", as: :tasks
      get "/tasks/:id", to: "tasks.show", as: :task
      get "/tasks/new", to: "tasks.new", as: :task_new
      post "/tasks", to: "tasks.create", as: :task_create
      get "/tasks/:id/edit", to: "tasks.edit", as: :task_edit
      patch "/tasks/:id", to: "tasks.patch", as: :task_patch
      put "/tasks/:id", to: "tasks.update", as: :task_update
      delete "/tasks/:id", to: "tasks.delete", as: :task_delete
    end
  end
end
