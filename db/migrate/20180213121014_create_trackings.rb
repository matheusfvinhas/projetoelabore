class CreateTrackings < ActiveRecord::Migration[5.1]
  def change
    create_table :trackings do |t|
      t.references :enrollment, foreign_key: true
      t.references :grade, foreign_key: true

      t.timestamps
    end
  end
end
