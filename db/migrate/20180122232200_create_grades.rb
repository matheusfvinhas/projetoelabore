# frozen_string_literal: true

class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.string :title, limit: 100
      t.string :description, limit: 255
      t.string :video_link, limit: 100
      t.string :document
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
