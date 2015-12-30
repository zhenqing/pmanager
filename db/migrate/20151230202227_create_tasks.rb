class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :project, index:true
      t.string :title
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true
      t.integer :deptch, :null =>false, :default => 0
      t.integer :children_count, :null => false, :default => 0
      t.string :content
      t.string :status

      t.timestamps null: false
    end
  end
end
