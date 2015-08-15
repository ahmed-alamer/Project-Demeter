class ChangeProjectIdToIntInGrants < ActiveRecord::Migration
  def change
  	change_column :grants, :project_id, :integer
  end
end
