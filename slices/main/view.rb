# auto_register: false
# frozen_string_literal: true

module Main
  # The main view.
  class View < Hemo::View
    config.paths = [Pathname(__dir__).join("templates").expand_path]
  end
end
