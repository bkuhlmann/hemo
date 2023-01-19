# frozen_string_literal: true

module Main
  module Actions
    module Tasks
      # Processes index action.
      class Index < Main::Action
        include Deps[repository: "repositories.task"]

        def handle(*, response) = response.render view, tasks: repository.all
      end
    end
  end
end
