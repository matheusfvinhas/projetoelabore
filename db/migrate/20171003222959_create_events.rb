# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, limit: 100
      t.string :description, limit: 255
      t.string :local, limit: 100
      t.date :date
      t.time :time
      t.references :user, index: true, foreign_key: true
      t.json :images

      t.timestamps
    end
  end
end
