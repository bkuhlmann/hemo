# frozen_string_literal: true

module Tasks
  module Repositories
    # Defines the tasks repository.
    class Task < Tasks::Repository[:tasks]
      ORDER = proc { created_at.asc }

      commands :create, update: :by_pk, delete: :by_pk

      def initialize(order: ORDER, **)
        @order = order
        super(**)
      end

      def find(id) = tasks.combine(:user).by_pk(id).one

      def find_by_description text
        tasks.combine(:user)
             .where { description.ilike "%#{text}%" }
             .to_a
      end

      def all = tasks.combine(:user).order(&order).to_a

      private

      attr_reader :order
    end
  end
end
