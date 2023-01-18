# frozen_string_literal: true

module Tasks
  module Relations
    # The user relation.
    class User < DB::Relation
      schema :users, infer: true do
        associations { has_many :tasks }
      end
    end
  end
end
