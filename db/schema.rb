# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 16) do

  create_table "clubs", :force => true do |t|
    t.datetime "date_saved"
    t.integer  "type_id"
    t.string   "make"
    t.string   "model"
    t.integer  "loft_degs",     :limit => 10, :precision => 10, :scale => 0
    t.integer  "lie_degs",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "length_inches", :limit => 10, :precision => 10, :scale => 0
    t.string   "grip"
  end

  create_table "clubsets", :force => true do |t|
    t.datetime "date_saved"
    t.integer  "user_id"
    t.string   "name"
  end

  create_table "coaches", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.integer  "school_id"
    t.string   "description"
    t.integer  "state_id"
    t.integer  "zip"
    t.string   "url"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courseholes", :force => true do |t|
    t.integer  "course_id"
    t.integer  "par"
    t.integer  "yardage"
    t.integer  "holenum"
    t.integer  "handicap"
    t.datetime "date_added"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.integer  "rating",     :limit => 10, :precision => 10, :scale => 0
    t.integer  "slope"
    t.integer  "num_holes"
    t.integer  "total_par"
    t.datetime "date_added"
  end

  create_table "diaries", :force => true do |t|
    t.datetime "date_saved"
    t.integer  "user_id"
    t.string   "subject"
    t.text     "body"
  end

  create_table "instructors", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "state_id"
    t.integer  "zip"
    t.string   "url"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "played_holes", :force => true do |t|
    t.integer "user_id"
    t.integer "round_id"
    t.integer "hole_id"
    t.integer "score"
    t.integer "putts"
  end

  create_table "rounds", :force => true do |t|
    t.datetime "date_played"
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "weather_id"
    t.integer  "holes_played"
    t.integer  "clubset_id"
    t.integer  "total_score"
    t.integer  "total_putts"
    t.integer  "total_gir"
    t.integer  "fairways_hit"
    t.integer  "fairways_right"
    t.integer  "fairways_left"
    t.integer  "fairway_opps"
    t.integer  "sand_saves"
    t.integer  "save_opps"
    t.integer  "up_downs"
    t.integer  "updown_opps"
  end

  create_table "strokes", :force => true do |t|
    t.integer "user_id"
    t.integer "round_id"
    t.integer "hole_id"
    t.integer "shot_num"
    t.integer "shot_type_id"
    t.integer "club_id"
    t.integer "from"
    t.integer "ended_up"
  end

  create_table "tgolfer", :primary_key => "GolferID", :force => true do |t|
    t.string  "GolferFirstName",    :limit => 50, :default => "", :null => false
    t.string  "GolferLastName",     :limit => 50, :default => "", :null => false
    t.integer "CurrentScoreRelPar", :limit => 6
    t.text    "GolferMemo"
    t.integer "DegsofWallyVal",     :limit => 4
    t.string  "GolferImage",        :limit => 50
    t.integer "active",             :limit => 6,  :default => 0,  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "email_alt"
    t.integer  "subscription_id"
    t.datetime "subscribed_date"
    t.integer  "send_email"
    t.string   "salt"
    t.string   "hashed_password"
  end

end
