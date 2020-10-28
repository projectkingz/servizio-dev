# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_06_193834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "addresses", force: :cascade do |t|
    t.string "address_formatted_address"
    t.string "address_street_number"
    t.string "address_street_name"
    t.string "address_town"
    t.string "address_city"
    t.string "address_post_code"
    t.string "address_building"
    t.string "address_notes"
    t.string "address_county"
    t.string "address_county_code"
    t.string "address_country"
    t.string "address_country_code"
    t.float "address_lat"
    t.float "address_lng"
    t.bigint "client_id"
    t.bigint "listing_id"
    t.bigint "offer_id"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_address_on_client_id"
    t.index ["listing_id"], name: "index_address_on_listing_id"
    t.index ["offer_id"], name: "index_address_on_offer_id"
    t.index ["type"], name: "index_address_on_type"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.string "full_name"
    t.string "from"
    t.text "about"
    t.string "language"
    t.boolean "status", default: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.index ["created_at"], name: "index_admins_on_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["id"], name: "index_admins_on_id"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bookings", id: :bigint, default: nil, force: :cascade do |t|
    t.text "note"
    t.integer "tip_offered"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "booking_date", null: false
    t.string "booking_expiry"
    t.string "client_name"
    t.string "supplier_name"
    t.datetime "complete_by_date"
    t.bigint "client_id", null: false
    t.bigint "supplier_id", null: false
    t.bigint "offer_id", null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["created_at"], name: "index_bookings_on_created_at"
    t.index ["id"], name: "index_bookings_on_id"
    t.index ["offer_id"], name: "index_bookings_on_offer_id"
    t.index ["supplier_id"], name: "index_bookings_on_supplier_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_categories_on_id"
  end

  create_table "category_sections", force: :cascade do |t|
    t.integer "category_id"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "home_phone"
    t.string "mobile_phone"
    t.string "work_phone"
    t.bigint "client_id"
    t.bigint "supplier_id"
    t.bigint "admin_id"
    t.bigint "listing_id"
    t.bigint "booking_id"
    t.bigint "quote_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.index ["mobile_phone"], name: "index_contacts_on_mobile_phone"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.string "video"
    t.boolean "active", default: false
    t.float "budget"
    t.bigint "urgency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "has_single_pricing", default: false
    t.integer "pricing_id"
    t.datetime "expiry_date", precision: 6
    t.bigint "client_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_listings_on_category_id"
    t.index ["client_id"], name: "index_listings_on_client_id"
    t.index ["created_at"], name: "index_listings_on_created_at"
    t.index ["id"], name: "index_listings_on_id"
    t.index ["urgency_id"], name: "index_listings_on_urgency_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.integer "price"
    t.integer "discount_offer"
    t.string "offer_per"
    t.integer "delivery"
    t.date "valid_from"
    t.date "valid_to"
    t.integer "offer_duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "supplier_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_offers_on_category_id"
    t.index ["created_at"], name: "index_offers_on_created_at"
    t.index ["id"], name: "index_offers_on_id"
    t.index ["supplier_id"], name: "index_offers_on_supplier_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.string "overview"
    t.text "description"
    t.integer "days_to_complete"
    t.integer "price"
    t.integer "pricing_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_pricings_on_category_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.date "booking_date"
    t.datetime "quote_expiry"
    t.string "title"
    t.float "quote_amount"
    t.integer "status", default: 0
    t.string "client_name"
    t.string "supplier_name"
    t.bigint "listing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "complete_by_date"
    t.bigint "client_id", null: false
    t.bigint "supplier_id", null: false
    t.index ["client_id"], name: "index_quotes_on_client_id"
    t.index ["created_at"], name: "index_quotes_on_created_at"
    t.index ["id"], name: "index_quotes_on_id"
    t.index ["listing_id"], name: "index_quotes_on_listing_id"
    t.index ["supplier_id"], name: "index_quotes_on_supplier_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review"
    t.integer "stars", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "quote_id", null: false
    t.bigint "booking_id", null: false
    t.bigint "client_id", null: false
    t.bigint "supplier_id", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["id"], name: "index_reviews_on_id"
    t.index ["quote_id"], name: "index_reviews_on_quote_id"
    t.index ["supplier_id"], name: "index_reviews_on_supplier_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.string "full_name"
    t.string "from"
    t.text "about"
    t.string "language"
    t.boolean "status", default: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.index ["created_at"], name: "index_trades_on_created_at"
    t.index ["email"], name: "index_trades_on_email", unique: true
    t.index ["id"], name: "index_trades_on_id"
    t.index ["reset_password_token"], name: "index_trades_on_reset_password_token", unique: true
  end

  create_table "urgencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.string "full_name"
    t.string "from"
    t.text "about"
    t.string "language"
    t.boolean "status"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
