class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :username, limit: 20
      t.string :name, limit: 50
      t.string :responsible, limit: 50
      t.string :telephone, limit: 15
      t.string :mini_cv, limit: 5000
      t.integer :kind
      t.boolean :new_user, default: true

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
