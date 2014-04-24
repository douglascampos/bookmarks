class Expense < ActiveRecord::Base
	belongs_to :user

	# ensure that a user_id is present
	validates :user_id, presence: true
end
