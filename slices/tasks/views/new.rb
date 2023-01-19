# frozen_string_literal: true

module Tasks
  module Views
    # The new view.
    class New < Tasks::View
      expose :users
      expose :error
    end
  end
end
