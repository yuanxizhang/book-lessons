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

  before_save :downcase_email

  def downcase_email
     email.downcase!
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create
  end

end
