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

ActiveRecord::Schema.define(version: 20170523105244) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "quantity"
    t.float    "price"
    t.float    "total"
    t.integer  "cart_id"
    t.integer  "shop_detail_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["shop_detail_id"], name: "index_cart_items_on_shop_detail_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_products", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comment_products_on_product_id"
    t.index ["user_id"], name: "index_comment_products_on_user_id"
  end

  create_table "comment_shops", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_comment_shops_on_shop_id"
    t.index ["user_id"], name: "index_comment_shops_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.text     "description"
    t.string   "image"
    t.float    "avg_rating"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "rating_products", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_rating_products_on_product_id"
    t.index ["user_id"], name: "index_rating_products_on_user_id"
  end

  create_table "rating_shops", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_rating_shops_on_shop_id"
    t.index ["user_id"], name: "index_rating_shops_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id", "follower_id"], name: "index_relationships_on_followed_id_and_follower_id", unique: true
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "shop_details", force: :cascade do |t|
    t.integer  "quantity"
    t.float    "price"
    t.float    "total"
    t.integer  "shop_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shop_details_on_product_id"
    t.index ["shop_id"], name: "index_shop_details_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_shops_on_category_id"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "phone_number"
    t.string   "username"
    t.integer  "role"
    t.boolean  "certified"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
