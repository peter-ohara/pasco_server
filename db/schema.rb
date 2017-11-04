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

ActiveRecord::Schema.define(version: 20171104143807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "level"
    t.integer "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_purchases_on_course_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id"
    t.integer "question_type"
    t.float "priority"
    t.string "number"
    t.text "question"
    t.text "choices"
    t.text "answer"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "content"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "course_code"
    t.integer "quiz_type"
    t.integer "year"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course_name"
    t.float "duration"
    t.integer "visibility", default: 0
    t.bigint "course_id"
    t.index ["course_id"], name: "index_quizzes_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pasco_gold"
  end

  add_foreign_key "purchases", "courses"
  add_foreign_key "purchases", "users"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "courses"
end
