class AddGrantDateToGrants < ActiveRecord::Migration
  def change
  	add_column :grants, :grant_date, :date
  end
end
