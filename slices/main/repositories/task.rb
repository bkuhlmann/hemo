# frozen_string_literal: true

module Main
  module Repositories
    # Defines the tasks repository.
    class Task < Main::Repository[:tasks]
      ORDER = proc { created_at.asc }

      commands :create, update: :by_pk, delete: :by_pk

      def initialize(order: ORDER, **)
        super(**)
        @order = order
      end

      def find(id) = tasks.combine(:user).by_pk(id).one

      def all = tasks.combine(:user).order(&order).to_a

      private

      attr_reader :order
    end
  end
end
