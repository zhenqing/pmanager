class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.string :status
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
