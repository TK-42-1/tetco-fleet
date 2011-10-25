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

ActiveRecord::Schema.define(:version => 20111024193936) do

  create_table "drivers", :force => true do |t|
    t.text     "fname"
    t.text     "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "plate"
    t.string   "vin"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "driver_id"
    t.string   "status"
    t.integer  "milage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_orders", :force => true do |t|
    t.integer  "vehicle_id"
    t.string   "invoice"
    t.string   "inv_date"
    t.integer  "milage"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.string   "category"
    t.string   "description"
    t.string   "serviced"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
