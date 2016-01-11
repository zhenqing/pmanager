class AddRowOrderToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :row_order, :integer
  end
end
