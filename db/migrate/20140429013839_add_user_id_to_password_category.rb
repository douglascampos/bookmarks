class AddUserIdToPasswordCategory < ActiveRecord::Migration
  def change
    add_column :password_category, :user_id, :integer
  end
end
