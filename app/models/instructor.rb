class Instructor < ApplicationRecord
  has_many :lessons
  has_many :skills, through: :lessons
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
end
