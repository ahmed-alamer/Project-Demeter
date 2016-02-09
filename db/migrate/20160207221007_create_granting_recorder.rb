class CreateGrantingRecorder < ActiveRecord::Migration
  def change
    create_table :granting_recorders do |t|
      t.integer :grant_month
      t.boolean :is_granted
    end
  end
end
