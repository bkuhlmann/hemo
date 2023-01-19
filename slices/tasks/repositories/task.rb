# frozen_string_literal: true

module Tasks
  module Repositories
    # The task repository.
    class Task < DB::Repository[:tasks]
      commands :create, update: :by_pk, delete: :by_pk

      def find(id) = tasks.combine(:user).by_pk(id).one

      def find_by_description text
        tasks.combine(:user)
             .where { description.ilike "%#{text}%" }
             .to_a
      end

      def all
        tasks.combine(:user)
             .order { created_at.asc }
             .to_a
      end
    end
  end
end
