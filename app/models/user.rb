class User < ApplicationRecord
  has_many :bookings
  has_many :lessons, through: :bookings

  has_secure_password

  validates_presence_of :email, :on => :create
  validates :email, uniqueness: true

	validates_presence_of :password, :on => :create
  validates :password, length: { in: 6..20 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
