class ChangeGrantStatueToString < ActiveRecord::Migration
  def change
  	change_column :grants, :status, :string
  end
end
