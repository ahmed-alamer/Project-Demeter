class CreateApprovalStatuses < ActiveRecord::Migration
  def change
    create_table :approval_statuses, {:id => false} do |t|
      t.string :code
      t.string :details

      t.timestamps null: false
    end
  end
end
