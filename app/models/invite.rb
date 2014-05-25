class Invite < ActiveRecord::Base
	has_one :user

	before_create :generate_token

	def generate_token
		while self.token.nil? do
			token = SecureRandom.hex(6)
			self.token = token if Invite.where(token: token).blank?
		end
	end
end
