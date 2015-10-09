class RemoveEntryDateFromBounty < ActiveRecord::Migration
  def change
  	remove_column :bounties, :entry_date
  end
end
