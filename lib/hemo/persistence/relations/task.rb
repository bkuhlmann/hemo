# frozen_string_literal: true

module Hemo
  module Persistence
    module Relations
      # Defines task relation.
      class Task < ROM::Relation[:sql]
        schema :tasks, infer: true do
          associations { belongs_to :user }
        end
      end
    end
  end
end
