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

ActiveRecord::Schema.define(version: 20170812192642) do

  create_table "info_changes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "requester_id"
    t.bigint "receiver_id"
    t.bigint "user_id"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_info_changes_on_receiver_id"
    t.index ["requester_id"], name: "index_info_changes_on_requester_id"
    t.index ["user_id"], name: "index_info_changes_on_user_id"
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needs_assessments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "requester_id"
    t.bigint "receiver_id"
    t.bigint "user_id"
    t.string "relationship"
    t.boolean "is_known"
    t.text "needs"
    t.string "time_frame"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_needs_assessments_on_receiver_id"
    t.index ["requester_id"], name: "index_needs_assessments_on_requester_id"
    t.index ["user_id"], name: "index_needs_assessments_on_user_id"
  end

  create_table "servers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "member_id"
    t.string "service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_servers_on_member_id"
  end

  create_table "service_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "requester_id"
    t.bigint "receiver_id"
    t.bigint "user_id"
    t.string "service_needed"
    t.text "comments"
    t.date "date1"
    t.date "date2"
    t.string "service_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_service_requests_on_receiver_id"
    t.index ["requester_id"], name: "index_service_requests_on_requester_id"
    t.index ["user_id"], name: "index_service_requests_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "member_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["member_id"], name: "index_users_on_member_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "info_changes", "members", column: "receiver_id"
  add_foreign_key "info_changes", "members", column: "requester_id"
  add_foreign_key "info_changes", "users"
  add_foreign_key "needs_assessments", "members", column: "receiver_id"
  add_foreign_key "needs_assessments", "members", column: "requester_id"
  add_foreign_key "needs_assessments", "users"
  add_foreign_key "servers", "members"
  add_foreign_key "service_requests", "members", column: "receiver_id"
  add_foreign_key "service_requests", "members", column: "requester_id"
  add_foreign_key "service_requests", "users"
  add_foreign_key "users", "members"
end
