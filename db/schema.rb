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

ActiveRecord::Schema.define(version: 20151011125349) do

  create_table "pages", force: :cascade do |t|
    t.integer  "subject_id", limit: 4
    t.string   "name",       limit: 25
    t.string   "permalink",  limit: 255
    t.integer  "position",   limit: 8
    t.boolean  "visible",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree
  add_index "pages", ["subject_id"], name: "index_pages_on_subject_id", using: :btree

  create_table "pages_students", id: false, force: :cascade do |t|
    t.integer "page_id",    limit: 4
    t.integer "student_id", limit: 4
  end

  add_index "pages_students", ["page_id", "student_id"], name: "index_pages_students_on_page_id_and_student_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "page_id",      limit: 255
    t.string   "name",         limit: 25
    t.integer  "position",     limit: 8
    t.boolean  "visible",                    default: false
    t.string   "content_type", limit: 255
    t.text     "content",      limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "sections", ["page_id"], name: "index_sections_on_page_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "username",        limit: 50
    t.string   "email",           limit: 255, default: "1", null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "password_digest", limit: 255
  end

  create_table "students_sections", id: false, force: :cascade do |t|
    t.integer "student_id", limit: 4
    t.integer "section_id", limit: 4
  end

  add_index "students_sections", ["student_id", "section_id"], name: "index_students_sections_on_student_id_and_section_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 25
    t.integer  "position",   limit: 8
    t.boolean  "visible",               default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

end
