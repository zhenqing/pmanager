class AddDisplayToProject < ActiveRecord::Migration
  def change
    add_column :projects, :display, :boolean
  end
end
