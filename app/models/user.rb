class User < ActiveRecord::Base
	has_secure_password
	
	has_many :recipes
	has_many :ingredients, through: :recipes
	
	validates :name, uniqueness: true, presence: true
	
	def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
			user.password = rand(36**length).to_s(36) #Random String
    end
  end
end
