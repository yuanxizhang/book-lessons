class Instructor < ApplicationRecord
  has_many :lessons
  has_many :subjects, through: :lessons
end
