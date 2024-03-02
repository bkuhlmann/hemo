# frozen_string_literal: true

require "hanami/boot"
Bundler.require :tools if Hanami.env? :development

app = Rack::Builder.app { run Hanami.app }

run app
