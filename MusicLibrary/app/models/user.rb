class User < ActiveRecord::Base
	attr_reader :password
	validates :email, :session_token, uniqueness: true
	validates :email, :password_digest, :session_token, presence: true
	after_initialize :ensure_session_token
	

	def self.find_by_credentials(email, password)
      @user = User.find_by(email: email)
      return @user if (@user && @user.is_password?(password))
      nil
    end

    def password=(new_password)
      @password = new_password 
	  self.password_digest = BCrypt::Password.create(new_password).to_s
	end

	def is_password?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def reset_session_token!
      @session_token = SecureRandom.urlsafe_base64
      self.save!
      self.session_token
	end

	def ensure_session_token
	  self.session_token ||= SecureRandom.urlsafe_base64
	end
end
