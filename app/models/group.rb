# Represents a group of entities associated with a user.
class Group < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :entities

  validates :name, length: { maximum: 80 }, presence: true
end
