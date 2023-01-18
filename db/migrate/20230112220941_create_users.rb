# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id, :bigint
      column :email, :text, null: false
      column :name, :text, null: false
      column :created_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
