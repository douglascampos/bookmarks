class CreatePasswordCategory < ActiveRecord::Migration
  def change
    create_table :password_category do |t|
      t.string :titulo
      t.string :descricao

      t.timestamps
    end
  end
end
