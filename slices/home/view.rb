# auto_register: false
# frozen_string_literal: true

module Home
  # The slice base view.
  class View < Hemo::View
    config.layouts_dir = Hanami.app.root.join "app/templates/layouts"
  end
end
