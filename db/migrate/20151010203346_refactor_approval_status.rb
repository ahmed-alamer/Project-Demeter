class RefactorApprovalStatus < ActiveRecord::Migration
  def change
    drop_table :approval_statuses

    create_table 'approval_statuses', :id => false do |t|
      t.string   'code'
      t.string   'details', limit: 255
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
    end

    execute 'ALTER TABLE approval_statuses ADD PRIMARY KEY (code);'
  end
end
