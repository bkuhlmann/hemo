# frozen_string_literal: true

module Tasks
  module Actions
    # The create action.
    class Create < Tasks::Action
      include Deps[
        task_repository: "repositories.task",
        user_repository: "repositories.user",
        show_view: "views.show"
      ]

      params do
        required(:task).hash do
          required(:user_id).filled :integer
          required(:description).filled :string
        end
      end

      def handle request, response
        parameters = request.params

        if parameters.valid?
          task = task_repository.create parameters[:task]
          response.render show_view, task: task_repository.find(task.id)
        else
          response.render view, users: user_repository.all, error: parameters.errors[:task]
        end
      end
    end
  end
end
