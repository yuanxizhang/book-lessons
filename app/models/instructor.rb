class Instructor < ApplicationRecord
  has_many :lessons
  has_many :skills, through: :lessons

  validates :name, presence: true
end
