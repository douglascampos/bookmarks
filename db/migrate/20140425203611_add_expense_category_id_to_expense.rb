class AddExpenseCategoryIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :ExpenseCategory_id, :integer
  end
end
