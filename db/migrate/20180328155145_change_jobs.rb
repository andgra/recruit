class ChangeJobs < ActiveRecord::Migration[5.1]
  def change
    change_table :jobs do |t|
      t.boolean :is_deleted, :default => false
    end
  end
end
