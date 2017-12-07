class CreateParceiros < ActiveRecord::Migration[5.1]
  def change
    create_table :parceiros do |t|
      t.string :name, limit: 50
      t.string :responsible, limit: 50
      t.string :email, limit: 50
      t.text :about, limit: 5000
      t.string :confirmed, limit: 1

      t.timestamps
    end
  end
end
