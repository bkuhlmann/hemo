# frozen_string_literal: true

require "refinements/arrays"

module Main
  module Views
    module Tasks
      # Renders main edit view.
      class Edit < Main::View
        using Refinements::Arrays

        expose :task
        expose :users
        expose :error

        expose :error_description do |error:|
          error[:description].to_sentence if error.key? :description
        end
      end
    end
  end
end
