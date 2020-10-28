class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string "address_formatted_address"
      t.string "address_street_number"
      t.string "address_street_name"
      t.string "address_street"
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
      # t.datetime "created_at", precision: 6, null: false
      # t.datetime "updated_at", precision: 6, null: false
      t.bigint "client_id"
      t.bigint "listing_id"
      t.bigint "offer_id"
      t.string "type"
      t.index ["client_id"], name: "index_address_on_client_id"
      t.index ["listing_id"], name: "index_address_on_listing_id"
      t.index ["offer_id"], name: "index_address_on_offer_id"
      t.index ["type"], name: "index_address_on_type"

      t.timestamps
    end
  end
end
