# frozen_string_literal: true

Factory.define :user, struct_namespace: Tasks::Structs do |factory|
  factory.email { fake :internet, :email }
  factory.name { fake :name, :name }
  factory.created_at { Time.now.utc }
end
