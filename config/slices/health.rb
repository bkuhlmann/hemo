# frozen_string_literal: true

module Health
  # The health slice configuration.
  class Slice < Hanami::Slice
    import keys: ["assets"], from: Hanami.app.container, as: :app
  end
end
