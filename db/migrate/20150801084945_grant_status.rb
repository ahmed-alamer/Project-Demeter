class GrantStatus < ActiveRecord::Migration
  def change
  	add_column :grants, :status, :integer
  end
end
