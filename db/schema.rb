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

ActiveRecord::Schema.define(version: 20150619135343) do

  create_table "playlists", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.integer "playlist_id", limit: 4
    t.integer "song_id",     limit: 4
  end

  add_index "playlists_songs", ["playlist_id"], name: "index_playlists_songs_on_playlist_id", using: :btree
  add_index "playlists_songs", ["song_id"], name: "index_playlists_songs_on_song_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "title",              limit: 255
    t.string   "artist",             limit: 255
    t.datetime "year"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "mfile_file_name",    limit: 255
    t.string   "mfile_content_type", limit: 255
    t.integer  "mfile_file_size",    limit: 4
    t.datetime "mfile_updated_at"
    t.string   "album",              limit: 255
    t.integer  "track_nr",           limit: 4
    t.string   "genre",              limit: 255
  end

  add_index "songs", ["user_id"], name: "fk_rails_d36a8dd57d", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",           limit: 255
    t.string   "uid",                limit: 255
    t.string   "name",               limit: 255
    t.string   "oauth_token",        limit: 255
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.string   "city",               limit: 255
    t.string   "country",            limit: 255
    t.text     "description",        limit: 65535
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "email",              limit: 255
    t.string   "aasm_state",         limit: 255
  end

  add_foreign_key "songs", "users"
end
