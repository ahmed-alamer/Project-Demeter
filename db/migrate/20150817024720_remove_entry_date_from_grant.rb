class RemoveEntryDateFromGrant < ActiveRecord::Migration
  def change
  	remove_column :grants, :entry_date
  end
end
