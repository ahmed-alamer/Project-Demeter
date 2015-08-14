class SetDefaultProjectStatus < ActiveRecord::Migration
  def change
  	change_column :projects, :status, :string, :default => "P"
  end
end
