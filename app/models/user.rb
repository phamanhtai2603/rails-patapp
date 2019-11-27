class User < ApplicationRecord
<<<<<<< HEAD

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	before_save {email.downcase!}
	validates :name, presence: true
	validates :email, presence: true, length: {maximum: Settings.maxlength}, format: {with: VALID_EMAIL_REGEX}
=======
	before_save {self.email = email.downcase}
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
>>>>>>> 6075bef... Chapter 5: Filling the layout
	validates :email, uniqueness: true

	has_secure_password
end
