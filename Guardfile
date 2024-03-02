# frozen_string_literal: true

guard :rspec, cmd: "NO_COVERAGE=true bin/rspec --format documentation" do
  require "guard/rspec/dsl"

  dsl = Guard::RSpec::Dsl.new self

  # Ruby
  ruby = dsl.ruby
  dsl.watch_spec_files_for ruby.lib_files

  # RSpec
  rspec = dsl.rspec
  watch rspec.spec_files

  # Hanami
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(%r(^spec/hanami_helper.rb$)) { rspec.spec_dir }
  watch(%r(^app/(.+)\.rb$)) { |result| rspec.spec.call "app/#{result[1]}" }
  watch(%r(^slices/(.+)\.rb$)) { |result| rspec.spec.call "slices/#{result[1]}" }
end
