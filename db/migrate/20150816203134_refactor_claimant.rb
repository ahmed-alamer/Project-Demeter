class RefactorClaimant < ActiveRecord::Migration
  def change
  	remove_column :claimants, :address
  	rename_column :claimants, :name, :first_name
  	add_column :claimants, :last_name, :string
  end
end
