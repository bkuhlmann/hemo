# frozen_string_literal: true

require "hanami/helpers"
require "hemo"

module Main
  module Views
    module Parts
      # A task part.
      class Task < Hanami::View::Part
        include Hanami::Helpers

        def assignee = user.name

        def checked = ("checked" if completed_at)

        def css_class = completed_at ? "task task-completed" : "task"

        def delete_button
          html.button "Delete",
                      Hemo.htmxify(
                        class: "button button-decline",
                        hx: {target: "closest .task", delete: "/tasks/#{value.id}", type: "submit"}
                      )
        end

        def dom_id = "task_#{id}"
      end
    end
  end
end
