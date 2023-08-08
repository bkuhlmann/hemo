# frozen_string_literal: true

module Tasks
  module Views
    # Renders search results.
    class Search < Tasks::View
      expose :tasks
    end
  end
end
