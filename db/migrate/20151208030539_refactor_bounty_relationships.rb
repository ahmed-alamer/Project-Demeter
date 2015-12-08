class RefactorBountyRelationships < ActiveRecord::Migration
  def change
    remove_column :bounties, :grant_id
    add_column :bounties, :project_id, :integer
  end
end
