class ChangeGrantsAmountToBigInt < ActiveRecord::Migration
  def change
    change_column :grants, :amount, :decimal, :precision => 50, :scale => 10
  end
end
