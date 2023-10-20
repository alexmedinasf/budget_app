# frozen_string_literal: true

# Migration to add name to users table in the database. This is a Devise migration.
class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
  end
end
