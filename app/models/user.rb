class User < ApplicationRecord
  has_many :bookings
  has_many :lessons, through: :bookings

  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable,
       :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
               user.provider = auth.provider
               user.uid = auth.uid
               user.email = auth.info.email
               user.password = Devise.friendly_token[0,20]
               user.skip_confirmation!
      end
  end

  def self.create_from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
end
