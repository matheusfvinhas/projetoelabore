class CreateEditals < ActiveRecord::Migration[5.1]
  def change
    create_table :editals do |t|
      t.string :titulo, limit: 100
      t.text :descricao, limit: 255
      t.references :user, index: true, foreign_key: true
      t.string :document
      
      t.timestamps
    end
  end
end
