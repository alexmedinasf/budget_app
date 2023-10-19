# frozen_string_literal: true

# Represents a user of the application with authentication capabilities.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities, foreign_key: :user_id
  has_many :groups, foreign_key: :user_id

  validates :name, length: { maximum: 80 }, presence: true
end
