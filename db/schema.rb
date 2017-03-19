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

ActiveRecord::Schema.define(version: 20170318120925) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "friend_id",  limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "friendships", ["friend_id"], name: "fk_rails_d78dc9c7fd", using: :btree
  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true, using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "address",    limit: 65535
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.boolean  "is_public",                default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "share_places", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "friend_id",  limit: 4, null: false
    t.integer  "place_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "share_places", ["friend_id"], name: "fk_rails_a1d096ab7b", using: :btree
  add_index "share_places", ["place_id"], name: "fk_rails_3a88a35ff0", using: :btree
  add_index "share_places", ["user_id", "friend_id", "place_id"], name: "index_share_places_on_user_id_and_friend_id_and_place_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "share_places", "places"
  add_foreign_key "share_places", "users"
  add_foreign_key "share_places", "users", column: "friend_id"
end
