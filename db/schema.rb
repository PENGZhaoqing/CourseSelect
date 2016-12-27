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

ActiveRecord::Schema.define(version: 20161215121614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "announcement_content"
    t.string   "announcement_title"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "course_infos", force: :cascade do |t|
    t.integer  "course_code"
    t.string   "course_day"
    t.string   "course_class"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "course_code"
    t.string   "course_type"
    t.string   "teaching_type"
    t.string   "exam_type"
    t.string   "credit"
    t.integer  "limit_num"
    t.integer  "student_num",   default: 0
    t.string   "class_room"
    t.string   "course_time"
    t.string   "course_week"
    t.integer  "department"
    t.string   "academic_year"
    t.string   "semester"
    t.text     "description"
    t.string   "apply"
    t.integer  "teacher_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "departs", force: :cascade do |t|
    t.string   "dept_name"
    t.string   "dept_contact"
    t.string   "dept_office"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "grade"
    t.boolean  "apply",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "grades", ["course_id"], name: "index_grades_on_course_id", using: :btree
  add_index "grades", ["user_id"], name: "index_grades_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "num"
    t.string   "major"
    t.integer  "department"
    t.string   "student_class"
    t.boolean  "reset"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.boolean  "teacher",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
