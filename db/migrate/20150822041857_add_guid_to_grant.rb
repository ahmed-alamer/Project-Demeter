class AddGuidToGrant < ActiveRecord::Migration
  def change
  	add_column :grants, :GUID, :string
  end
end
