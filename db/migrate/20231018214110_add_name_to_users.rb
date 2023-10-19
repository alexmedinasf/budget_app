# frozen_string_literal: true

# Migration to add a 'name' column to the 'users' table.
class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
  end
end
