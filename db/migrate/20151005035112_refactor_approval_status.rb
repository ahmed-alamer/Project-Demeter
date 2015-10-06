class RefactorApprovalStatus < ActiveRecord::Migration
  drop_table :approval_statuses
  create_table :approval_statuses do |t|
    t.string :code
    t.string :details

    t.timestamps null: false
  end

end
