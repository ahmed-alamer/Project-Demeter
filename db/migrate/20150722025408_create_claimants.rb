class CreateClaimants < ActiveRecord::Migration
  def change
    create_table :claimants do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :country

      t.timestamps null: false
    end
  end
end
