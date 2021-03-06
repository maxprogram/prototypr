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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130518175631) do

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.string   "title"
    t.text     "description"
    t.date     "end_date"
    t.float    "min_price"
    t.float    "max_price"
    t.integer  "vote"
    t.boolean  "flag"
    t.boolean  "active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "submissions", :force => true do |t|
    t.float    "price"
    t.string   "timeframe"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.integer  "reputation"
    t.boolean  "flag"
    t.boolean  "active"
    t.text     "profile"
    t.text     "bio"
    t.string   "web"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "email",                   :default => "", :null => false
    t.string   "encrypted_password",      :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.string   "profileimg_file_name"
    t.string   "profileimg_content_type"
    t.integer  "profileimg_file_size"
    t.datetime "profileimg_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
