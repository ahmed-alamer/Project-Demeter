class AddDocsLinkToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :documentation, :string
  end
end
