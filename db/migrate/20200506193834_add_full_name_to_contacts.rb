class AddFullNameToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :full_name, :string
  end
end
