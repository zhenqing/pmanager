class AddFinishAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :finshed_at, :datetime
    add_column :projects, :plan_finish_at, :datetime
  end
end
