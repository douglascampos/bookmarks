class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :login
      t.string :pass
      t.string :url
      t.string :obs

      t.timestamps
    end
  end
end
