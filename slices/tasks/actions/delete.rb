# frozen_string_literal: true

module Tasks
  module Actions
    # The delete action.
    class Delete < Tasks::Action
      include Deps[repository: "repositories.task"]

      using Hemo::Refines::Actions::Response

      params { required(:id).filled :integer }

      def handle request, response
        parameters = request.params

        halt :unprocessable_entity unless parameters.valid?

        repository.delete parameters[:id]
        response.with body: "", status: 200
      end
    end
  end
end
