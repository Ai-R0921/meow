# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_17_132517) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "post_image_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_image_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_image_id"], name: "index_post_image_comments_on_post_image_id"
    t.index ["user_id"], name: "index_post_image_comments_on_user_id"
  end

  create_table "post_image_favorites", force: :cascade do |t|
    t.integer "post_image_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_image_id"], name: "index_post_image_favorites_on_post_image_id"
    t.index ["user_id"], name: "index_post_image_favorites_on_user_id"
  end

  create_table "post_images", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "type_id", null: false
    t.string "image"
    t.string "title", null: false
    t.text "body", null: false
    t.integer "sex", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_post_images_on_type_id"
    t.index ["user_id"], name: "index_post_images_on_user_id"
  end

  create_table "post_lost_cat_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_lost_cat_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_lost_cat_id"], name: "index_post_lost_cat_comments_on_post_lost_cat_id"
    t.index ["user_id"], name: "index_post_lost_cat_comments_on_user_id"
  end

  create_table "post_lost_cat_favorites", force: :cascade do |t|
    t.integer "post_Lost_cat_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_Lost_cat_id"], name: "index_post_lost_cat_favorites_on_post_Lost_cat_id"
    t.index ["user_id"], name: "index_post_lost_cat_favorites_on_user_id"
  end

  create_table "post_lost_cats", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "type_id", null: false
    t.string "image"
    t.string "title", null: false
    t.text "body", null: false
    t.integer "sex", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_post_lost_cats_on_type_id"
    t.index ["user_id"], name: "index_post_lost_cats_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "profile_image"
    t.boolean "is_deleted", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "post_image_comments", "post_images"
  add_foreign_key "post_image_comments", "users"
  add_foreign_key "post_image_favorites", "post_images"
  add_foreign_key "post_image_favorites", "users"
  add_foreign_key "post_images", "types"
  add_foreign_key "post_images", "users"
  add_foreign_key "post_lost_cat_comments", "post_lost_cats"
  add_foreign_key "post_lost_cat_comments", "users"
  add_foreign_key "post_lost_cat_favorites", "post_Lost_cats"
  add_foreign_key "post_lost_cat_favorites", "users"
  add_foreign_key "post_lost_cats", "types"
  add_foreign_key "post_lost_cats", "users"
  add_foreign_key "relationships", "users"
end
