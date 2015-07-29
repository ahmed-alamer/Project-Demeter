class ChangeClaimantReferenceAtWallet < ActiveRecord::Migration
  def change
  	rename_column :wallets, :owner, :claimant_id
  end
end
