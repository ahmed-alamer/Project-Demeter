class RemoveApproalCodeFromGrants < ActiveRecord::Migration
  def change
  	remove_column :grants, :approval_code
  end
end
