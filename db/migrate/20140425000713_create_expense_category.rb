class CreateExpenseCategory < ActiveRecord::Migration
  def change
    create_table :expense_category do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
