# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_08_224248) do
  create_table "busquedas", force: :cascade do |t|
    t.string "tipo"
    t.string "categoria"
    t.string "texto"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resultados", force: :cascade do |t|
    t.string "url"
    t.text "value"
    t.integer "busqueda_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["busqueda_id"], name: "index_resultados_on_busqueda_id"
  end

  add_foreign_key "resultados", "busquedas"
end
