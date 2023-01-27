# frozen_string_literal: true

module Tasks
  module Actions
    # The patch action.
    class Patch < Tasks::Action
      include Deps[repository: "repositories.task", show_view: "views.show"]

      params do
        required(:id).filled :integer
        optional(:task).hash { optional(:completed).filled :string }
      end

      def initialize(now: Time.now.utc, **)
        @now = now
        super(**)
      end

      def handle request, response
        parameters = request.params

        halt :unprocessable_entity unless parameters.valid?

        id = parameters[:id]

        case parameters.to_h
          in task: {completed: _} then response.render show_view, task: complete(id)
          else response.render show_view, task: uncomplete(id)
        end
      end

      private

      attr_reader :now

      def complete id
        repository.update id, completed_at: now
        repository.find id
      end

      def uncomplete id
        repository.update id, completed_at: nil
        repository.find id
      end
    end
  end
end
