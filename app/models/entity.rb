# Represents an individual entity associated with a user and potentially multiple groups.
class Entity < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :groups, foreign_key: :group_id

  validates :name, length: { maximum: 80 }, presence: true
end
