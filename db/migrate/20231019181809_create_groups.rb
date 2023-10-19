# frozen_string_literal: true

# This migration creates the 'groups' table, which will store information about groups.
# Each group is associated with a user and has a name and an icon.
# The 'timestamps' column is also added to track when the record was created and updated.
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
