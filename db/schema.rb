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

ActiveRecord::Schema[8.0].define(version: 2025_06_13_180940) do
  create_table "areas", charset: "utf8mb3", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco", precision: 10
    t.integer "quantidade_poltronas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estatisticas", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingressos", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.bigint "sessao_id", null: false
    t.bigint "poltrona_id", null: false
    t.bigint "area_id", null: false
    t.decimal "valor", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_ingressos_on_area_id"
    t.index ["poltrona_id"], name: "index_ingressos_on_poltrona_id"
    t.index ["sessao_id"], name: "index_ingressos_on_sessao_id"
    t.index ["usuario_id"], name: "index_ingressos_on_usuario_id"
  end

  create_table "pecas", charset: "utf8mb3", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.string "classificacao"
    t.string "duracao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poltronas", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.string "numero"
    t.boolean "disponivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_poltronas_on_area_id"
  end

  create_table "sessoes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "peca_id", null: false
    t.integer "horario", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["peca_id"], name: "index_sessoes_on_peca_id"
  end

  create_table "status_tests", charset: "utf8mb3", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", charset: "utf8mb3", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "endereco"
    t.date "data_nascimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingressos", "areas"
  add_foreign_key "ingressos", "poltronas"
  add_foreign_key "ingressos", "sessoes"
  add_foreign_key "ingressos", "usuarios"
  add_foreign_key "poltronas", "areas"
  add_foreign_key "sessoes", "pecas"
end
