class AddAdjustmentGrantFlagToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :adjusted, :boolean, :default => false
  end
end
