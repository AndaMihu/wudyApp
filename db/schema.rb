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

ActiveRecord::Schema.define(version: 2018_12_23_154104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.text "message"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.index ["student_id"], name: "index_chats_on_student_id"
    t.index ["teacher_id"], name: "index_chats_on_teacher_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "available_spots"
    t.string "company_description"
    t.string "internship_description"
    t.integer "employees_number"
    t.string "website"
    t.bigint "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cvr"
    t.string "company_address"
    t.integer "zip_code"
    t.string "country"
    t.string "internship_address"
    t.string "city"
    t.bigint "company_user_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["company_user_id"], name: "index_companies_on_company_user_id"
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "company_positions", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_positions_on_company_id"
    t.index ["position_id"], name: "index_company_positions_on_position_id"
  end

  create_table "company_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "job_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mobile_phone"
    t.boolean "accepted", default: false
    t.index ["email"], name: "index_company_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_company_users_on_reset_password_token", unique: true
  end

  create_table "contact_company_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "job"
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_contact_company_users_on_contract_id"
  end

  create_table "contact_languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_company_user_accepts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.bigint "company_id"
    t.boolean "accept", default: false
    t.index ["company_id"], name: "index_contract_company_user_accepts_on_company_id"
    t.index ["contract_id"], name: "index_contract_company_user_accepts_on_contract_id"
  end

  create_table "contract_teacher_accepts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.bigint "teacher_id"
    t.boolean "accept", default: false
    t.index ["contract_id"], name: "index_contract_teacher_accepts_on_contract_id"
    t.index ["teacher_id"], name: "index_contract_teacher_accepts_on_teacher_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "internship_type_id"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_contracts_on_company_id"
    t.index ["internship_type_id"], name: "index_contracts_on_internship_type_id"
    t.index ["student_id"], name: "index_contracts_on_student_id"
    t.index ["teacher_id"], name: "index_contracts_on_teacher_id"
  end

  create_table "daily_goals", force: :cascade do |t|
    t.string "title"
    t.date "end_date"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_daily_goals_on_student_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.index ["student_id"], name: "index_events_on_student_id"
    t.index ["teacher_id"], name: "index_events_on_teacher_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internship_agreements", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "weekly_working_hours"
    t.string "work_tasks"
    t.string "learning_goals"
    t.string "other_comments"
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_internship_agreements_on_contract_id"
  end

  create_table "internship_coaches", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_internship_coaches_on_student_id"
    t.index ["teacher_id"], name: "index_internship_coaches_on_teacher_id"
  end

  create_table "internship_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.date "meeting_date"
    t.index ["student_id"], name: "index_meetings_on_student_id"
    t.index ["teacher_id"], name: "index_meetings_on_teacher_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_positions_on_company_id"
  end

  create_table "programmes", force: :cascade do |t|
    t.string "name"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_id"], name: "index_programmes_on_university_id"
  end

  create_table "project_timelines", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_project_timelines_on_company_id"
  end

  create_table "student_programmes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.bigint "programme_id"
    t.index ["programme_id"], name: "index_student_programmes_on_programme_id"
    t.index ["student_id"], name: "index_student_programmes_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "cv"
    t.string "profile_picture"
    t.string "education"
    t.string "work_experience"
    t.string "volunteer_experience"
    t.string "hard_skills"
    t.string "soft_skills"
    t.string "interests"
    t.string "mobile_phone"
    t.bigint "project_timeline_id"
    t.bigint "programme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "accepted", default: false
    t.string "good_want"
    t.string "good_not"
    t.string "bad_want"
    t.string "bad_not"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["programme_id"], name: "index_students_on_programme_id"
    t.index ["project_timeline_id"], name: "index_students_on_project_timeline_id"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "project_timeline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_timeline_id"], name: "index_tasks_on_project_timeline_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "specialization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "university_id"
    t.string "access_token"
    t.string "refresh_token"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "accepted", default: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_teachers_on_university_id"
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chats", "students"
  add_foreign_key "chats", "teachers"
  add_foreign_key "companies", "company_users"
  add_foreign_key "companies", "industries"
  add_foreign_key "company_positions", "companies"
  add_foreign_key "company_positions", "positions"
  add_foreign_key "contact_company_users", "contracts"
  add_foreign_key "contract_company_user_accepts", "companies"
  add_foreign_key "contract_company_user_accepts", "contracts"
  add_foreign_key "contract_teacher_accepts", "contracts"
  add_foreign_key "contract_teacher_accepts", "teachers"
  add_foreign_key "contracts", "companies"
  add_foreign_key "contracts", "internship_types"
  add_foreign_key "contracts", "students"
  add_foreign_key "contracts", "teachers"
  add_foreign_key "daily_goals", "students"
  add_foreign_key "events", "students"
  add_foreign_key "events", "teachers"
  add_foreign_key "internship_agreements", "contracts"
  add_foreign_key "internship_coaches", "students"
  add_foreign_key "internship_coaches", "teachers"
  add_foreign_key "meetings", "students"
  add_foreign_key "meetings", "teachers"
  add_foreign_key "positions", "companies"
  add_foreign_key "programmes", "universities"
  add_foreign_key "project_timelines", "companies"
  add_foreign_key "student_programmes", "programmes"
  add_foreign_key "student_programmes", "students"
  add_foreign_key "students", "teachers"
  add_foreign_key "tasks", "project_timelines"
  add_foreign_key "teachers", "universities"
end
