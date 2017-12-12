class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.string :title, limit: 100
      t.text :description, limit: 255
      t.references :user, index: true, foreign_key: true
      t.string :document
      
      t.timestamps
    end
  end
end
