class Lesson < ApplicationRecord
  belongs_to :subject
  belongs_to :instructor
  has_many :bookings
  has_many :users, through: :bookings
 end
