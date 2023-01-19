# frozen_string_literal: true

module Tasks
  module Actions
    # The new action.
    class New < Tasks::Action
      include Deps[user_repository: "repositories.user"]

      def handle(*, response)
        response.render view, users: user_repository.all, error: Dry::Core::EMPTY_HASH
      end
    end
  end
end
