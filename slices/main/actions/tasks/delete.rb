# frozen_string_literal: true

module Main
  module Actions
    module Tasks
      # Processes delete action.
      class Delete < Main::Action
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
end
