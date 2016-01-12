class AddFinishAtToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :finshed_at, :datetime
    add_column :tasks, :plan_finish_at, :datetime
  end
end
