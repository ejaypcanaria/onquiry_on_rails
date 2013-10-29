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

ActiveRecord::Schema.define(version: 20131029134119) do

  create_table "questions", force: true do |t|
    t.string   "question",   null: false
    t.text     "details"
    t.string   "permalink",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["question", "permalink"], name: "unique_question_permalink_index", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name", limit: 60,  null: false
    t.string   "last_name",  limit: 50,  null: false
    t.string   "email",      limit: 100, null: false
    t.string   "password",   limit: 40,  null: false
    t.string   "salt",       limit: 40,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email", "password", "salt"], name: "index_users_on_email_and_password_and_salt", using: :btree
  add_index "users", ["email"], name: "users_unique_email", unique: true, using: :btree

end
