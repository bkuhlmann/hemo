# frozen_string_literal: true

module Tasks
  module Views
    # Renders main new view.
    class New < Tasks::View
      expose :users
      expose :error
    end
  end
end
