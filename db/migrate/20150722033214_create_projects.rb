class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :GUID
      t.string :name
      t.decimal :nameplate
      t.string :address
      t.string :post_code
      t.string :country
      t.string :install_date

      t.timestamps null: false
    end
  end
end
