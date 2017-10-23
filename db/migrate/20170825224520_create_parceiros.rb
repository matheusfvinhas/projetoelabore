class CreateParceiros < ActiveRecord::Migration[5.1]
  def change
    create_table :parceiros do |t|
      t.string :nome, limit: 50
      t.string :responsavel, limit: 50
      t.string :email, limit: 50
      t.text :sobre, limit: 5000

      t.timestamps
    end
  end
end
