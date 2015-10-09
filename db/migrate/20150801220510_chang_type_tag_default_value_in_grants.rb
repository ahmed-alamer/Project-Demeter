class ChangTypeTagDefaultValueInGrants < ActiveRecord::Migration
  def change
  	change_column :grants, :type_tag, :string, :default => "PGRT"
  end
end
