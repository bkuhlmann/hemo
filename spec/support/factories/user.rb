# frozen_string_literal: true

Test::Factory.define :user do |factory|
  factory.email { fake :internet, :email }
  factory.name { fake :name, :name }
  factory.created_at { Time.now.utc }
end
