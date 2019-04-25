class Lesson < ApplicationRecord
  belongs_to :skill
  belongs_to :instructor
  has_many :bookings
  has_many :users, through: :bookings
end
