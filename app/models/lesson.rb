class Lesson < ApplicationRecord
  belongs_to :skill
  belongs_to :instructor
  has_many :bookings
  has_many :users, through: :bookings

  validates :title, presence: true
  scope :available, -> { where(available: true) }
end
