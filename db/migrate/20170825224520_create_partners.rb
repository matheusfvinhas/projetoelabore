class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.string :name, limit: 50
      t.string :responsible, limit: 50
      t.string :email, limit: 50
      t.text :about, limit: 5000
      t.boolean :confirmed
      t.string :telephone, limit: 15
      
      t.timestamps
    end
  end
end
