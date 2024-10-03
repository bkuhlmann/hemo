# frozen_string_literal: true

module Tasks
  module Repositories
    # The task repository.
    class Task < DB::Repository
      ORDER = proc { created_at.asc }

      # TODO: Enable once Hanami 2.2.0 supports commands.
      # commands :create, update: :by_pk, delete: :by_pk

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

      # TODO: Remove once Hanami 2.2.0 supports commands.
      def create(attributes) = tasks.changeset(:create, attributes).commit

      # TODO: Remove once Hanami 2.2.0 supports commands.
      def update(id, **) = tasks.by_pk(id).update(**)

      # TODO: Remove once Hanami 2.2.0 supports commands.
      def delete(id, **) = tasks.by_pk(id).delete(**)

      private

      attr_reader :order
    end
  end
end
