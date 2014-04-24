class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :description
      t.decimal :cost

      t.timestamps
    end
  end
end
