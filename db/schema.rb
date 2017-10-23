# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171003222959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "editals", force: :cascade do |t|
    t.string "titulo", limit: 100
    t.text "descricao", limit: 255
    t.integer "usuario_id"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string "titulo", limit: 100
    t.string "descricao", limit: 255
    t.string "local", limit: 100
    t.datetime "data"
    t.integer "usuario_id"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parceiros", force: :cascade do |t|
    t.string "nome", limit: 50
    t.string "responsavel", limit: 50
    t.string "email", limit: 50
    t.text "sobre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", limit: 20
    t.string "nome", limit: 50
    t.string "responsavel", limit: 50
    t.string "telefone", limit: 15
    t.string "minicv", limit: 5000
    t.integer "tipo"
    t.string "novo_usuario", limit: 1
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
