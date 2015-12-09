class RefactorWalletRelation < ActiveRecord::Migration
  def change
    remove_column :wallets, :claimant_id
    add_column :wallets, :project_id, :integer
  end
end
