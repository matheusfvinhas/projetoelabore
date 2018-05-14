class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name, limit: 50
      t.string :manager, limit: 50

      t.timestamps
    end
  end
end
