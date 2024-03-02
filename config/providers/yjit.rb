# frozen_string_literal: true

Hanami.app.register_provider :yjit do
  start { RubyVM::YJIT.enable }
end
