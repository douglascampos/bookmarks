class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookmarks
  has_many :expenses
  has_many :passwords
  has_many :category
  has_many :expense_category
  has_many :password_category
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
