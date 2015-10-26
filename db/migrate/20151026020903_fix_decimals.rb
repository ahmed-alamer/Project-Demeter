class FixDecimals < ActiveRecord::Migration
  def change
    change_column :projects, :nameplate, :decimal, precision: 10, scale: 6
    change_column :bounties, :amount, :decimal, precision: 10, scale: 6
    change_column :grants, :amount, :decimal, precision: 10, scale: 6
  end
end
