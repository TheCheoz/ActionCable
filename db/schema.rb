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

ActiveRecord::Schema.define(version: 20171209160247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversaciones", force: :cascade do |t|
    t.integer "receptor_id"
    t.integer "remitente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receptor_id", "remitente_id"], name: "index_conversaciones_on_receptor_id_and_remitente_id", unique: true
    t.index ["receptor_id"], name: "index_conversaciones_on_receptor_id"
    t.index ["remitente_id"], name: "index_conversaciones_on_remitente_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "friendable_type"
    t.bigint "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_type", "friendable_id"], name: "index_friendships_on_friendable_type_and_friendable_id"
  end

  create_table "mensajes", force: :cascade do |t|
    t.text "cuerpo"
    t.bigint "usuario_id"
    t.bigint "conversacion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversacion_id"], name: "index_mensajes_on_conversacion_id"
    t.index ["usuario_id"], name: "index_mensajes_on_usuario_id"
  end

  create_table "perfiles", force: :cascade do |t|
    t.bigint "usuario_id"
    t.string "primer_nombre"
    t.string "segundo_nombre"
    t.string "primer_apellido"
    t.string "segundo_apellido"
    t.string "apodo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_perfiles_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "mensajes", "conversaciones", column: "conversacion_id"
  add_foreign_key "mensajes", "usuarios"
  add_foreign_key "perfiles", "usuarios"
end
