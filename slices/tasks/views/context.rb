# auto_register: false
# frozen_string_literal: true

module Tasks
  module Views
    # The task slice context.
    class Context < Hanami::View::Context
      include Deps[app_assets: "app.assets"]
    end
  end
end
