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

ActiveRecord::Schema.define(:version => 20121014175025) do

  create_table "game_challenges", :force => true do |t|
    t.integer  "game_id"
    t.datetime "started_at"
    t.datetime "start_typing_at"
    t.datetime "submit_first_time_at"
    t.datetime "pass_level_at"
    t.text     "user_answer"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.text     "last_compiling_error"
    t.text     "last_compiling_error_trace"
    t.integer  "tries_before_sucess",        :default => 0
    t.text     "last_answer"
    t.integer  "level"
    t.integer  "score",                      :default => 0
  end

  add_index "game_challenges", ["game_id"], :name => "index_game_challenges_on_game_id"

  create_table "games", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "current_level", :default => 1
    t.integer  "score",         :default => 0
  end

end
