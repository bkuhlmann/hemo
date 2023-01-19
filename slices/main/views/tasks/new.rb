# frozen_string_literal: true

require "refinements/arrays"

module Main
  module Views
    module Tasks
      # Renders main new view.
      class New < Main::View
        using Refinements::Arrays

        expose :error
        expose :users

        expose :error_description do |error:|
          error[:description].to_sentence if error.key? :description
        end
      end
    end
  end
end
