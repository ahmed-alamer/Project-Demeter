class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.string :GUID
      t.date :entry_date
      t.decimal :amount
      t.string :receiver_wallet
      t.string :grant_id

      t.timestamps null: false
    end
  end
end
