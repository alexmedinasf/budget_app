# frozen_string_literal: true

# Migration to create groups table in the database. This is a Devise migration.
class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :user
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
