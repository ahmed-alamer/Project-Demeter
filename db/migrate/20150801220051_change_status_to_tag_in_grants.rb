class ChangeStatusToTagInGrants < ActiveRecord::Migration
  def change
  	rename_column :grants, :status, :type_tag
  end
end
