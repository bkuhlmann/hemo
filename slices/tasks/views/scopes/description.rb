# frozen_string_literal: true

require "refinements/array"

module Tasks
  module Views
    module Scopes
      # The description specific behavior for partials.
      class Description < Hanami::View::Scope
        using Refinements::Array

        def value = content

        def message = (error[:description].to_sentence if error.key? :description)
      end
    end
  end
end
