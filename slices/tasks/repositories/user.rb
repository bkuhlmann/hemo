# frozen_string_literal: true

module Tasks
  module Repositories
    # Defines the users repository.
    class User < Tasks::Repository[:users]
      commands :create, update: :by_pk, delete: :by_pk

      def find(id) = users.by_pk(id).one

      def all
        order = proc { created_at.desc }
        users.order(&order).to_a
      end
    end
  end
end
