class RefactorProject < ActiveRecord::Migration
  def change
  	remove_column :projects, :GUID
  end
end
