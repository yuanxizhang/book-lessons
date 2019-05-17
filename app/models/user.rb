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

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      # user.name = auth["info"]["nickname"]
    end
  end
end
