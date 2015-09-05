class ChangeApprovalCodeToString < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE approval_statuses CHANGE COLUMN code code VARCHAR(255) NOT NULL;"
  end
end
