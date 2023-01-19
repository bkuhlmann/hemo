# frozen_string_literal: true

module Tasks
  module Views
    # Renders main index view.
    class Index < Tasks::View
      expose :tasks
    end
  end
end
