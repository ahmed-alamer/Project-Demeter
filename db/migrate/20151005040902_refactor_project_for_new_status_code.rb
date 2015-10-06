class RefactorProjectForNewStatusCode < ActiveRecord::Migration
  def change
    change_column :projects, :approval_status_id, :integer, :default => 0
  end
end
