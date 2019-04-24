class Topic < ApplicationRecord
  has_many :lessons
  has_many :instructors, through: :lessons
end
