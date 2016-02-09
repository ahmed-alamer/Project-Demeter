class CreateGrantedMonths < ActiveRecord::Migration
  def change
    create_table :granted_months do |t|
      t.integer :grant_month
      t.integer :grant_year

      t.timestamps null: false
    end
  end
end
