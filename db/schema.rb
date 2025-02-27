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

ActiveRecord::Schema.define(version: 20151122120914) do

  create_table "jobs", force: true do |t|
    t.string   "company",       limit: 200
    t.string   "url",           limit: 300
    t.string   "email",         limit: 200
    t.integer  "type_id"
    t.integer  "location_id"
    t.string   "title",         limit: 200
    t.string   "description",   limit: 8000
    t.string   "how_to_apply",  limit: 100
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remote_option",              default: false
  end

  create_table "locations", force: true do |t|
    t.string "name"
  end

  create_table "types", force: true do |t|
    t.string "name"
  end

end
