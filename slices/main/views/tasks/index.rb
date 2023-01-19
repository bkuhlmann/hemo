# frozen_string_literal: true

require "hanami/helpers"
require "hemo"

module Main
  module Views
    module Tasks
      # Renders main index view.
      class Index < Main::View
        include Hanami::Helpers

        expose :tasks

        expose :new_link do
          link_to "New",
                  "/tasks/new",
                  Hemo.htmxify(
                    class: "new button button-accept",
                    hx: {
                      get: "/tasks/new",
                      trigger: "click",
                      target: ".tasks",
                      swap: "beforeend settle:0.1s"
                    }
                  )
        end
      end
    end
  end
end
