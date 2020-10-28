class RenameWorkPhonetToWorkPhone < ActiveRecord::Migration[6.0]
  def change
    rename_column :contacts, :work_phonet, :work_phone
  end
end
