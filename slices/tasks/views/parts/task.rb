# frozen_string_literal: true

module Tasks
  module Views
    module Parts
      # The task presentation logic.
      class Task < Hanami::View::Part
        def assignee = user.name

        def checked = ("checked" if completed_at)

        def css_class = completed_at ? "task task-completed" : "task"
      end
    end
  end
end
