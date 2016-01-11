class AddRowOrderToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :row_order, :integer
  end
end
