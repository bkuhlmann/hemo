# frozen_string_literal: true

module Tasks
  module Relations
    # The task relation.
    class Task < DB::Relation
      schema :tasks, infer: true do
        associations { belongs_to :user }
      end
    end
  end
end
