# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :tasks do
      primary_key :id, :bigint
      foreign_key :user_id, type: :bigint, null: false
      column :description, :text, null: false
      column :completed_at, :timestamp, null: true
      column :created_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
