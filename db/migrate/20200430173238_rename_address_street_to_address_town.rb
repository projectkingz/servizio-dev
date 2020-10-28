class RenameAddressStreetToAddressTown < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :address_street, :address_town
  end
end
