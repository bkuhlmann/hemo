# frozen_string_literal: true

development = ENV.fetch("HANAMI_ENV", "development") == "development"

require "concurrent"
require "localhost" if development

Bundler.require :tools if development
Bundler.root.join("tmp").then { |path| path.mkdir unless path.exist? }

max_threads = ENV.fetch "HANAMI_MAX_THREADS", 5
min_threads = ENV.fetch "HANAMI_MIN_THREADS", max_threads
concurrency = ENV.fetch "HANAMI_WEB_CONCURRENCY", Concurrent.physical_processor_count

threads min_threads, max_threads
port ENV.fetch "HANAMI_PORT", 2300
environment ENV.fetch "HANAMI_ENV", "development"
workers concurrency
worker_timeout 3600 if development
ssl_bind "localhost", 2443 if development
pidfile ENV.fetch "PIDFILE", "tmp/server.pid"
plugin :tmp_restart

preload_app! && before_fork { Hanami.shutdown } if concurrency.to_i.positive?
