# frozen_string_literal: true

# Migration to create 'entities' table with references to 'user', 'group',
# a 'name' column, an 'amount' column, and timestamps.
class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :user
      t.references :group
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
