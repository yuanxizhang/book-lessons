class Instructor < ApplicationRecord
  has_many :lessons
  has_many :skills, through: :lessons
  accepts_nested_attributes_for :lesson
end
