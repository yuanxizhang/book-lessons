class Skill < ApplicationRecord
  has_many :lessons
  has_many :instructors, through: :lessons

  validates :name, presence: true
end
