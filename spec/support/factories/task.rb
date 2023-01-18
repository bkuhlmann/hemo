# frozen_string_literal: true

Test::Factory.define :task do |factory|
  factory.association :user
  factory.description { fake :lorem, :words }
  factory.created_at { Time.now.utc }
end
