# frozen_string_literal: true

module Tasks
  module Actions
    # The index action.
    class Index < Tasks::Action
      include Deps[repository: "repositories.task", search_view: "views.search"]

      params { optional(:query).filled :string }

      def handle request, response
        query = request.params[:query]
        tasks = repository.find_by_description query

        if request.get_header("HTTP_HX_TRIGGER") == "search"
          add_htmx_headers response, query
          response.render search_view, tasks:
        else
          response.render view, tasks:
        end
      end

      private

      def add_htmx_headers response, query
        response.headers["HX-Push-Url"] = routes.path(:tasks_root) if query.empty?
      end
    end
  end
end
