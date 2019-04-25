class Instructor < ApplicationRecord
  has_many :lessons
  has_many :skills, through: :lessons
end
