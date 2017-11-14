class CreateEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventos do |t|
      t.string :titulo, limit: 100
      t.string :descricao, limit: 255
      t.string :local, limit: 100
      t.datetime :data
      t.integer :user_id
      t.json :images

      t.timestamps
    end
  end
end
