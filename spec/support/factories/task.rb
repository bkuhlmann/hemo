# frozen_string_literal: true

Factory.define :task, struct_namespace: Tasks::Structs do |factory|
  factory.association :user
  factory.description { fake :lorem, :words }
  factory.created_at { Time.now.utc }
end
