class Changeuuidtoid < ActiveRecord::Migration[6.0]
  def change

    # RESET ALL TABLES TO REMOVE UNNECESSARY DATA
    execute "TRUNCATE categories CASCADE";
    execute "TRUNCATE listings CASCADE";
    execute "TRUNCATE offers CASCADE";
    execute "TRUNCATE quotes CASCADE";
    execute "TRUNCATE reviews CASCADE";
    execute "TRUNCATE trades CASCADE";
    execute "TRUNCATE users CASCADE";

    # ADD COLUMNS TO BE USED AS THE NEW ID'S
   add_column :admins, :id_new, :bigint, null: false
   add_column :bookings, :id_new, :bigint, null: false
   add_column :bookings, :client_id_new, :bigint, null: false
   add_column :bookings, :supplier_id_new, :bigint, null: false
   add_column :bookings, :offer_id_new, :bigint, null: false
   add_column :categories, :id_new, :bigint, null: false
   add_column :listings, :id_new, :bigint, null: false
   add_column :listings, :client_id_new, :bigint, null: false
   add_column :listings, :category_id_new, :bigint, null: false
   add_column :offers, :id_new, :bigint, null: false
   add_column :offers, :supplier_id_new, :bigint, null: false
   add_column :offers, :category_id_new, :bigint, null: false
   add_column :quotes, :id_new, :bigint, null: false
   add_column :quotes, :client_id_new, :bigint, null: false
   add_column :quotes, :supplier_id_new, :bigint, null: false
   add_column :reviews, :id_new, :bigint, null: false
   add_column :reviews, :quote_id_new, :bigint, null: false
   add_column :reviews, :booking_id_new, :bigint, null: false
   add_column :reviews, :client_id_new, :bigint, null: false
   add_column :reviews, :supplier_id_new, :bigint, null: false
   add_column :trades, :id_new, :bigint, null: false
   add_column :users, :id_new, :bigint, null: false

   # FOR PARENT TABLE REMOVE ID (:uuid) COLUMNS
   execute "ALTER TABLE admins DROP COLUMN id CASCADE";
   execute "ALTER TABLE bookings DROP COLUMN id CASCADE";
   execute "ALTER TABLE categories DROP COLUMN id CASCADE";
   execute "ALTER TABLE listings DROP COLUMN id CASCADE";
   execute "ALTER TABLE offers DROP COLUMN id CASCADE";
   execute "ALTER TABLE quotes DROP COLUMN id CASCADE";
   execute "ALTER TABLE reviews DROP COLUMN id CASCADE";
   execute "ALTER TABLE trades DROP COLUMN id CASCADE";
   execute "ALTER TABLE users DROP COLUMN id CASCADE";

   # FOR THE ASSOCIATIONS IN A TABLE REMOVE col_id
    remove_column :bookings, :client_id
    remove_column :bookings, :supplier_id
    remove_column :bookings, :offer_id
    remove_column :listings, :client_id
    remove_column :listings, :category_id
    remove_column :offers, :supplier_id
    remove_column :offers, :category_id
    remove_column :quotes, :client_id
    remove_column :quotes, :supplier_id
    remove_column :reviews, :quote_id
    remove_column :reviews, :booking_id
    remove_column :reviews, :client_id
    remove_column :reviews, :supplier_id


    # RENAME THE REMAINING col_id_new TO col_id
    rename_column :bookings, :client_id_new , :client_id
    rename_column :bookings, :supplier_id_new , :supplier_id
    rename_column :bookings, :offer_id_new , :offer_id
    rename_column :listings, :client_id_new , :client_id
    rename_column :listings, :category_id_new , :category_id
    rename_column :offers, :supplier_id_new , :supplier_id
    rename_column :offers, :category_id_new , :category_id
    rename_column :quotes, :client_id_new , :client_id
    rename_column :quotes, :supplier_id_new , :supplier_id
    rename_column :reviews, :quote_id_new , :quote_id
    rename_column :reviews, :booking_id_new , :booking_id
    rename_column :reviews, :client_id_new , :client_id
    rename_column :reviews, :supplier_id_new , :supplier_id

    rename_column :admins, :id_new, :id
    rename_column :bookings, :id_new, :id
    rename_column :categories, :id_new, :id
    rename_column :listings, :id_new, :id
    rename_column :offers, :id_new, :id
    rename_column :quotes, :id_new, :id
    rename_column :reviews, :id_new, :id
    rename_column :trades, :id_new, :id
    rename_column :users, :id_new, :id

    # ADD INDEXES FOR ASSOCIATION
    add_index :bookings, :client_id
    add_index :bookings, :supplier_id
    add_index :bookings, :offer_id
    add_index :listings, :client_id
    add_index :listings, :category_id
    add_index :offers, :supplier_id
    add_index :offers, :category_id
    add_index :quotes, :client_id
    add_index :quotes, :supplier_id
    add_index :reviews, :quote_id
    add_index :reviews, :booking_id
    add_index :reviews, :client_id
    add_index :reviews, :supplier_id

    add_index :admins, :id
    add_index :bookings, :id
    add_index :categories, :id
    add_index :listings, :id
    add_index :offers, :id
    add_index :quotes, :id
    add_index :reviews, :id
    add_index :trades, :id
    add_index :users, :id

    # ADD THE PRIMARY KEY
    execute "ALTER TABLE admins ADD PRIMARY KEY (id)";
    execute "ALTER TABLE bookings ADD PRIMARY KEY (id)";
    execute "ALTER TABLE categories ADD PRIMARY KEY (id)";
    execute "ALTER TABLE listings ADD PRIMARY KEY (id)";
    execute "ALTER TABLE offers ADD PRIMARY KEY (id)";
    execute "ALTER TABLE quotes ADD PRIMARY KEY (id)";
    execute "ALTER TABLE reviews ADD PRIMARY KEY (id)";
    execute "ALTER TABLE trades ADD PRIMARY KEY (id)";
    execute "ALTER TABLE users ADD PRIMARY KEY (id)";

    # ADD AUTO_INCREMENT TO MY TABLES
    execute "ALTER SEQUENCE IF EXISTS id START WITH 1000 OWNED BY admins.id";
    # execute "ALTER TABLE bookings AUTO_INCREMENT = 1000";
    # execute "ALTER TABLE categories AUTO_INCREMENT = 1000";
    # execute "ALTER TABLE listings AUTO_INCREMENT = 1000";
    # execute "ALTER TABLE offers AUTO_INCREMENT = 1000";
    # execute "ALTER TABLE quotes AUTO_INCREMENT = 1000";
    # execute "ALTER TABLE reviews AUTO_INCREMENT = 1000";
    # execute "ALTER TABLE trades AUTO_INCREMENT = 1000";
    # execute "ALTER TABLE users AUTO_INCREMENT = 1000";

  end
end
