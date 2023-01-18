# frozen_string_literal: true

module Hemo
  module Persistence
    module Relations
      # Defines user relation.
      class User < ROM::Relation[:sql]
        schema :users, infer: true do
          associations { has_many :tasks }
        end
      end
    end
  end
end
