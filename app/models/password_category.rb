class PasswordCategory < ActiveRecord::Base
	belongs_to :user
	has_many :passwords
end
