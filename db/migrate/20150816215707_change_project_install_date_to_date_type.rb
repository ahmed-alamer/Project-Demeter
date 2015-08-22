class ChangeProjectInstallDateToDateType < ActiveRecord::Migration
  def change
  	change_column :projects, :install_date, :date
  end
end
