class SetApprovalStatusCodeAsPrimaryKey < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE approval_statuses ADD PRIMARY KEY(code)"
  end
end
