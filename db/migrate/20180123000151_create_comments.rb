class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text, limit: 255
      t.references :grade, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
