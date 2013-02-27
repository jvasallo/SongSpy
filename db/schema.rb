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

ActiveRecord::Schema.define(:version => 20130227204637) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "length"
    t.datetime "release_date"
    t.integer  "artist_id"
    t.integer  "label_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.float    "rating"
    t.string   "extension"
  end

  create_table "albums_genres", :id => false, :force => true do |t|
    t.integer "album_id", :null => false
    t.integer "genre_id", :null => false
  end

  create_table "albums_producers", :id => false, :force => true do |t|
    t.integer "album_id",    :null => false
    t.integer "producer_id", :null => false
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "occupation"
    t.datetime "birth_date"
    t.integer  "label_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "artists_genres", :id => false, :force => true do |t|
    t.integer "artist_id", :null => false
    t.integer "genre_id",  :null => false
  end

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "identities", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "founder"
    t.datetime "founded_date"
    t.string   "location"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "meanings", :force => true do |t|
    t.float    "rating"
    t.text     "content"
    t.integer  "song_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "producers", :force => true do |t|
    t.string   "name"
    t.text     "history"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.float    "rating"
    t.integer  "length"
    t.text     "lyrics"
    t.integer  "album_id"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "artist_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
