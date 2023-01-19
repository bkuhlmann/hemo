# frozen_string_literal: true

module Tasks
  module Repositories
    # The user repository.
    class User < DB::Repository
      commands :create, update: :by_pk, delete: :by_pk

      def find(id) = users.by_pk(id).one

      def all
        users.order { created_at.desc }
             .to_a
      end
    end
  end
end
