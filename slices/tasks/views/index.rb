# frozen_string_literal: true

module Tasks
  module Views
    # The index view.
    class Index < Tasks::View
      expose :tasks
    end
  end
end
