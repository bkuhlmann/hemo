# frozen_string_literal: true

module Tasks
  module Actions
    # The update action.
    class Update < Tasks::Action
      include Deps[
        task_repository: "repositories.task",
        user_repository: "repositories.user",
        show_view: "views.show",
        edit_view: "views.edit"
      ]

      params do
        required(:id).filled :integer
        required(:task).hash do
          optional(:user_id).filled :integer
          optional(:description).filled :string
          optional(:completed).maybe :string
        end
      end

      def initialize(now: Time.now.utc, **)
        @now = now
        super(**)
      end

      def handle request, response
        parameters = request.params
        task = task_repository.find parameters[:id]

        case parameters
          in {id: Integer, **nil} | {} then halt :unprocessable_entity
          in id: _, task: {description: content} unless content.empty?
            save task, parameters, response
          else edit task, parameters, response
        end
      end

      private

      attr_reader :now

      def save task, parameters, response
        id = task.id
        task_repository.update id,
                               user_id: user_repository.find(parameters.dig(:task, :user_id)).id,
                               description: parameters.dig(:task, :description),
                               completed_at: (now if parameters.dig :task, :completed)
        response.render show_view, task: task_repository.find(id)
      end

      def edit task, parameters, response
        response.render edit_view,
                        task:,
                        users: user_repository.all,
                        error: parameters.errors[:task]
      end
    end
  end
end
