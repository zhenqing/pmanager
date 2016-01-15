class AddDisplayToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :display, :boolean
  end
end
