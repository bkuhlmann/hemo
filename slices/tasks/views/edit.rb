# frozen_string_literal: true

module Tasks
  module Views
    # The edit view.
    class Edit < Tasks::View
      expose :task
      expose :users
      expose :error
    end
  end
end
