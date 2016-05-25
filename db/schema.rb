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

ActiveRecord::Schema.define(version: 20160525203408) do

  create_table "kanban_board_assignments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "task_id"
    t.integer  "user_id"
    t.string   "status",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "kanban_board_assignments", ["project_id"], name: "index_kanban_board_assignments_on_project_id"
  add_index "kanban_board_assignments", ["task_id"], name: "index_kanban_board_assignments_on_task_id"
  add_index "kanban_board_assignments", ["user_id"], name: "index_kanban_board_assignments_on_user_id"

  create_table "kanban_board_members", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "user_role",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "kanban_board_members", ["project_id"], name: "index_kanban_board_members_on_project_id"
  add_index "kanban_board_members", ["user_id"], name: "index_kanban_board_members_on_user_id"

  create_table "kanban_board_projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "finishing_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "kanban_card_tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "finishing_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "kanban_user_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "kanban_user_users", ["email"], name: "index_kanban_user_users_on_email", unique: true
  add_index "kanban_user_users", ["reset_password_token"], name: "index_kanban_user_users_on_reset_password_token", unique: true

end
