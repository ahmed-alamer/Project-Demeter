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

ActiveRecord::Schema.define(version: 20150723040800) do

  create_table "bounties", force: :cascade do |t|
    t.string   "GUID",            limit: 255
    t.date     "entry_date"
    t.decimal  "amount",                      precision: 10
    t.string   "receiver_wallet", limit: 255
    t.string   "grant_id",        limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "claimants", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "address",    limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "grants", force: :cascade do |t|
    t.string   "entry_date",      limit: 255
    t.string   "approval_code",   limit: 255
    t.decimal  "amount",                      precision: 10
    t.string   "project_id",      limit: 255
    t.string   "receiver_wallet", limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "GUID",         limit: 255
    t.string   "name",         limit: 255
    t.decimal  "nameplate",                precision: 10
    t.string   "address",      limit: 255
    t.string   "post_code",    limit: 255
    t.string   "country",      limit: 255
    t.string   "install_date", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string   "public_address", limit: 255
    t.string   "tag",            limit: 255
    t.integer  "owner",          limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end