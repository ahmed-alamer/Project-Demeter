class ClaimantProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :claimant_id, :integer
  end
end
