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

ActiveRecord::Schema[8.0].define(version: 2020_08_12_122606) do
  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "idea_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.index ["idea_id"], name: "index_comments_on_idea_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "done_count"
    t.string "photo_url"
    t.string "description"
    t.integer "user_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "ideas_users", id: false, force: :cascade do |t|
    t.integer "idea_id", null: false
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "password_digest"
    t.string "name"
    t.string "role"
    t.string "avatar"
  end

  add_foreign_key "comments", "ideas"
  add_foreign_key "comments", "users"
  add_foreign_key "ideas", "users"
end
