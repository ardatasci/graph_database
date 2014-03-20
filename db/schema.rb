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

ActiveRecord::Schema.define(:version => 20140320151143) do

  create_table "actors", :force => true do |t|
    t.string "identifier"
    t.string "name"
  end

  create_table "actors_broadcasts", :force => true do |t|
    t.integer "broadcast_id"
    t.integer "actor_id"
  end

  create_table "broadcasts", :force => true do |t|
    t.text     "description",      :null => false
    t.date     "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "duration"
    t.text     "summary"
    t.text     "long_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "identifier"
    t.integer  "program_id"
  end

  create_table "broadcasts_genres", :force => true do |t|
    t.integer "broadcast_id"
    t.integer "genre_id"
  end

  create_table "broadcasts_terms", :force => true do |t|
    t.integer "broadcast_id"
    t.integer "term_id"
    t.integer "frequency",    :default => 0
  end

  create_table "channel_programs", :force => true do |t|
    t.integer  "channel_id"
    t.integer  "program_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "channels", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "image_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "channels", ["name"], :name => "index_channels_on_name"

  create_table "genres", :force => true do |t|
    t.string "identifier"
  end

  create_table "programs", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "image_url"
    t.string   "identifier", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "channel_id"
  end

  add_index "programs", ["identifier"], :name => "index_programs_on_identifier"

  create_table "terms", :force => true do |t|
    t.string "identifier"
  end

end
