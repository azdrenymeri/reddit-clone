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

ActiveRecord::Schema.define(version: 2020_02_14_113140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "sub_reddit_id"
    t.integer "comments_count"
    t.index ["sub_reddit_id"], name: "index_posts_on_sub_reddit_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "sub_reddits", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.binary "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "posts_count"
    t.integer "members_count"
    t.index ["user_id"], name: "index_sub_reddits_on_user_id"
  end

  create_table "user_sub_reddits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sub_reddit_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "GREATEST(user_id, sub_reddit_id), LEAST(user_id, sub_reddit_id)", name: "index_user_sub_reddits_on_interchangable_user_id_and_sub_reddit", unique: true
    t.index "LEAST(user_id, sub_reddit_id), GREATEST(user_id, sub_reddit_id)", name: "index_user_sub_reddits_on_interchangable_sub_reddit_id_and_user", unique: true
    t.index ["sub_reddit_id"], name: "index_user_sub_reddits_on_sub_reddit_id"
    t.index ["user_id"], name: "index_user_sub_reddits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "bio"
    t.date "birth_date"
    t.binary "picture"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "sub_reddits"
  add_foreign_key "posts", "users"
  add_foreign_key "sub_reddits", "users"
  add_foreign_key "user_sub_reddits", "sub_reddits"
  add_foreign_key "user_sub_reddits", "users"
end
