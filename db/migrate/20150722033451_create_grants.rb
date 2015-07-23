class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string :entry_date
      t.string :approval_code
      t.decimal :amount
      t.string :project_id
      t.string :receiver_wallet

      t.timestamps null: false
    end
  end
end
