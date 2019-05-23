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

  def self.from_omniauth(auth_hash)
    password_str = (0...9).map{ ('a'..'z').to_a[rand(26)] }.join

    # Creates a new user only if it doesn't exist
    where(email: auth_hash.info.email).first_or_initialize do |user|
      user.email = auth_hash.info.email
      user.password = password_str
      user.password_confirmation = password_str
    end
  end

end
