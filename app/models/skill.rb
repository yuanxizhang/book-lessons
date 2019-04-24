class Skill < ApplicationRecord
  has_many :lessons
  has_many :instructors, through: :lessons
  accepts_nested_attributes_for :lesson
end
