class CreateApprovalStatusesWithKey < ActiveRecord::Migration
  def change
    create_table :approval_statuses, {:id => false} do |t|
      t.string :code
      t.string :details
      t.timestamps null: false
    end
    execute "ALTER TABLE approval_statuses ADD PRIMARY KEY (code);"
  end
end
