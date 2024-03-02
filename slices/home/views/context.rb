# auto_register: false
# frozen_string_literal: true

module Home
  module Views
    # The home slice context.
    class Context < Hanami::View::Context
      include Deps[app_assets: "app.assets"]
    end
  end
end
