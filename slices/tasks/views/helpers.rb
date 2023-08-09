# frozen_string_literal: true

require "htmx"

module Tasks
  module Views
    # The view helpers.
    module Helpers
      def search_input
        tag.input(
          id: "search",
          type: "search",
          name: "query",
          value: "",
          **HTMX[
            get: routes.path(:tasks_root),
            trigger: "search, keyup delay:200ms changed",
            target: "next .tasks",
            push_url: true,
            indicator: ".loader"
          ]
        )
      end

      def new_link
        path = routes.path :tasks_new

        link_to(
          "New",
          path,
          class: "new button button-accept",
          **HTMX[
            get: path,
            trigger: "click, keyup[ctrlKey&&key=='n'] from:body",
            target: ".tasks",
            swap: "beforeend settle:0.1s"
          ]
        )
      end

      def edit_link id
        path = routes.path(:tasks_edit, id:)

        link_to(
          "Edit",
          path,
          class: "button button-act",
          **HTMX[get: path, swap: "outerHTML swap:0s"]
        )
      end

      def edit_save_button
        tag.input type: :submit, value: "Save", class: "button button-accept"
      end

      def edit_cancel_link id
        path = routes.path(:tasks_show, id:)

        link_to(
          "Cancel",
          path,
          class: "button button-decline",
          **HTMX[trigger: "click, keyup[key=='Escape'] from:closest .task", get: path]
        )
      end

      def delete_button id
        tag.button(
          "Delete",
          type: "submit",
          class: "button button-decline",
          **HTMX[target: "closest .task", delete: routes.path(:tasks_delete, id:)]
        )
      end

      def create_save_button
        tag.input(
          name: :commit,
          type: :submit,
          value: "Save",
          class: "button button-accept",
          **HTMX[
            trigger: :click,
            target: "closest .task",
            swap: "outerHTML swap:0s",
            post: routes.path(:tasks_root)
          ]
        )
      end

      def create_cancel_link
        link_to "Cancel",
                routes.path(:tasks_root),
                class: "button button-decline",
                data: {remove: true}
      end
    end
  end
end
