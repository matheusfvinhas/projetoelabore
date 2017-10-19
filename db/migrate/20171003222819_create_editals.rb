class CreateEditals < ActiveRecord::Migration[5.1]
  def change
    create_table :editals do |t|
      t.string :titulo, limit: 100
      t.text :descricao, limit: 255
      t.integer :usuario_id
      t.string :document
      
      t.timestamps
    end
  end
end
