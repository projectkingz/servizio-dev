class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :home_phone
      t.string :mobile_phone
      t.string :work_phonet
      t.bigint :client_id , null: true, foreign_key: true
      t.bigint :supplier_id , null: true, foreign_key: true
      t.bigint :admin_id , null: true, foreign_key: true
      t.bigint :listing_id , null: true, foreign_key: true
      t.bigint :booking_id , null: true, foreign_key: true
      t.bigint :quote_id , null: true, foreign_key: true

      t.timestamps
    end
    add_index :contacts, :mobile_phone
  end
end
