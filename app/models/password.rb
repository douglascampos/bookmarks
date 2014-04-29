class Password < ActiveRecord::Base
	belongs_to :user
	belongs_to :password_category
end
