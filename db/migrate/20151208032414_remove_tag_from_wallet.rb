class RemoveTagFromWallet < ActiveRecord::Migration
  def change
    remove_column :wallets, :tag
  end
end
