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

ActiveRecord::Schema.define(version: 20160915162744) do

  create_table "active_questions", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "active_questions", ["question_id"], name: "index_active_questions_on_question_id", using: :btree
  add_index "active_questions", ["user_id"], name: "index_active_questions_on_user_id", using: :btree

  create_table "choices", force: :cascade do |t|
    t.string   "options",     limit: 255
    t.integer  "question_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "completeds", force: :cascade do |t|
    t.integer  "fullsurvey_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "completeds", ["fullsurvey_id"], name: "index_completeds_on_fullsurvey_id", using: :btree
  add_index "completeds", ["user_id"], name: "index_completeds_on_user_id", using: :btree

  create_table "fullsurveys", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "inactive_surveys", force: :cascade do |t|
    t.integer  "choice_id",   limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "question_id", limit: 4
  end

  add_index "inactive_surveys", ["choice_id"], name: "index_inactive_surveys_on_choice_id", using: :btree
  add_index "inactive_surveys", ["question_id"], name: "index_inactive_surveys_on_question_id", using: :btree
  add_index "inactive_surveys", ["user_id"], name: "index_inactive_surveys_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "options",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "question_id", limit: 4
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "type",          limit: 4
    t.integer  "questype",      limit: 4
    t.integer  "fullsurvey_id", limit: 4
  end

  add_index "questions", ["fullsurvey_id"], name: "index_questions_on_fullsurvey_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "email",              limit: 255
    t.string   "username",           limit: 255
    t.string   "password_digest",    limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "admin"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_foreign_key "active_questions", "questions"
  add_foreign_key "active_questions", "users"
  add_foreign_key "choices", "questions"
  add_foreign_key "completeds", "fullsurveys"
  add_foreign_key "completeds", "users"
  add_foreign_key "inactive_surveys", "choices"
  add_foreign_key "inactive_surveys", "questions"
  add_foreign_key "inactive_surveys", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "fullsurveys"
end
