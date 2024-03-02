# frozen_string_literal: true

module Home
  module Views
    # Renders show view.
    class Show < Home::View
      expose :ruby_version, default: RUBY_VERSION
      expose :hanami_version, default: Hanami::VERSION
    end
  end
end
