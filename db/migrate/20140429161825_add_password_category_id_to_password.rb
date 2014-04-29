class AddPasswordCategoryIdToPassword < ActiveRecord::Migration
  def change
    add_column :passwords, :PasswordCategory_id, :integer
  end
end
