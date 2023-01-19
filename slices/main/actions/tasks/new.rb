# frozen_string_literal: true

module Main
  module Actions
    module Tasks
      # Processes new action.
      class New < Main::Action
        include Deps[user_repository: "repositories.user"]

        def handle(*, response)
          response.render view, users: user_repository.all, error: Dry::Core::EMPTY_HASH
        end
      end
    end
  end
end
