class ChangeTableName < ActiveRecord::Migration
  def change
  	rename_table :categories, :category
  end
end
