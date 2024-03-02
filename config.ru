# frozen_string_literal: true

require "hanami/boot"
Bundler.require :tools if Hanami.env? :development

run Hanami.app
