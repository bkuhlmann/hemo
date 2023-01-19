# frozen_string_literal: true

module Tasks
  module Actions
    # The show action.
    class Show < Tasks::Action
      include Deps[repository: "repositories.task"]

      params { required(:id).filled :integer }

      def handle request, response
        parameters = request.params
        halt :unprocessable_entity unless parameters.valid?
        response.render view, task: repository.find(parameters[:id])
      end
    end
  end
end
