# frozen_string_literal: true

module Health
  module Actions
    # The show action.
    class Show < Hemo::Action
      using Hemo::Refines::Actions::Response

      handle_exception Exception => :down

      def handle(*, response) = response.with body: body(:green), status: 200

      private

      def down(*, response, _exception) = response.with body: body(:red), status: 503

      def body(color) = %(<html><body style="background-color: #{color}"></body></html>)
    end
  end
end
