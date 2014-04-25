class AddUserIdToExpenseCategory < ActiveRecord::Migration
  def change
    add_column :expense_category, :user_id, :integer
  end
end
