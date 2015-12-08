class ModelRefactoringForRc < ActiveRecord::Migration
  def change
    remove_column :claimants, :country
    remove_column :projects, :name
  end
end
