# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160630172522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apenados", force: :cascade do |t|
    t.string   "nome"
    t.date     "termino"
    t.text     "restricoes"
    t.string   "sexo"
    t.date     "nascimento"
    t.string   "mae"
    t.string   "documentos"
    t.string   "naturalidade"
    t.string   "condenado_por"
    t.string   "endereco"
    t.boolean  "ativo"
    t.string   "motivo_inativo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "unidade_id"
    t.string   "outras_informacoes"
  end

  add_index "apenados", ["unidade_id"], name: "index_apenados_on_unidade_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "filename"
    t.string   "short_name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "opos", force: :cascade do |t|
    t.integer  "unidade_id"
    t.string   "numero"
    t.string   "descricao"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.text     "texto"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "hora"
    t.string   "local"
    t.string   "evento"
    t.string   "solicitante"
  end

  add_index "opos", ["unidade_id"], name: "index_opos_on_unidade_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.integer  "apenado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["apenado_id"], name: "index_photos_on_apenado_id", using: :btree

  create_table "programas", force: :cascade do |t|
    t.string   "descricao"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.integer  "unidade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "programas", ["unidade_id"], name: "index_programas_on_unidade_id", using: :btree

  create_table "residencia", force: :cascade do |t|
    t.string   "telefones"
    t.string   "nome"
    t.string   "endereco"
    t.date     "data_saida"
    t.date     "retorno_previsto"
    t.boolean  "ja_retornou"
    t.string   "data_retorno"
    t.text     "informacoes_complementares"
    t.integer  "unidade_id"
    t.integer  "programa_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "residencia", ["programa_id"], name: "index_residencia_on_programa_id", using: :btree
  add_index "residencia", ["unidade_id"], name: "index_residencia_on_unidade_id", using: :btree

  create_table "unidades", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "matricula"
    t.string   "nome"
    t.boolean  "admin"
    t.integer  "unidade_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "apenado_id"
    t.date     "data_visita"
    t.boolean  "realizada"
    t.boolean  "alteracao"
    t.string   "ocorrencia"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "unidade_id"
  end

  add_index "visits", ["apenado_id"], name: "index_visits_on_apenado_id", using: :btree
  add_index "visits", ["unidade_id"], name: "index_visits_on_unidade_id", using: :btree

  add_foreign_key "apenados", "unidades"
  add_foreign_key "opos", "unidades"
  add_foreign_key "photos", "apenados"
  add_foreign_key "programas", "unidades"
  add_foreign_key "residencia", "programas"
  add_foreign_key "residencia", "unidades"
  add_foreign_key "visits", "apenados"
  add_foreign_key "visits", "unidades"
end
