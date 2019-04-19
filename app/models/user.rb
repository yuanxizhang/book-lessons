class User < ApplicationRecord
	has_many :authorizations
	
	has_secure_password

	validates_presence_of :name, :on => :create
	validates_presence_of :password, :on => :create

	def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.url = auth_hash['info']['urls']['Twitter']
    user.save!
    user
  end
end
