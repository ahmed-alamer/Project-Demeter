class SetDefaultValueForGrantStatus < ActiveRecord::Migration
  def change
  	change_column :grants, :status, :string, :default => "Pending"
  end
end
