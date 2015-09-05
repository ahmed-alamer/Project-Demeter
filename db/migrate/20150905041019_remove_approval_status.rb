class RemoveApprovalStatus < ActiveRecord::Migration
  def change
  	drop_table :approval_statuses
  end
end
