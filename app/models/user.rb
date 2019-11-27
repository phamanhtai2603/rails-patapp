class User < ApplicationRecord

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	before_save {email.downcase!}
	validates :name, presence: true
	validates :email, presence: true, length: {maximum: Settings.maxlength}, format: {with: VALID_EMAIL_REGEX}
	validates :email, uniqueness: true

	has_secure_password
end
