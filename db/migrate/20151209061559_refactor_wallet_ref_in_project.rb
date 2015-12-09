class RefactorWalletRefInProject < ActiveRecord::Migration
  def change
    add_column :projects, :wallet_address, :string
  end
end
