# frozen_string_literal: true

ROM::SQL.migration do
  up do
    create_table :users do
      primary_key :id, :bigint
      column :name, :text, null: false
      column :email, :text, null: false
      column :created_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, :timestamp, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down { drop_table :users }
end
