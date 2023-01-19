# frozen_string_literal: true

module Main
  module Actions
    module Tasks
      # Processes edit action.
      class Edit < Main::Action
        include Deps[task_repository: "repositories.task", user_repository: "repositories.user"]

        params { required(:id).filled :integer }

        def handle request, response
          parameters = request.params

          halt :unprocessable_entity unless parameters.valid?

          response.render view,
                          task: task_repository.find(parameters[:id]),
                          users: user_repository.all,
                          error: Dry::Core::EMPTY_HASH
        end
      end
    end
  end
end
