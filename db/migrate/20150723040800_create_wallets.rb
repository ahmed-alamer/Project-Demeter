class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :public_address
      t.string :tag
      t.integer :owner

      t.timestamps null: false
    end
  end
end
