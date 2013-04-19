class CreateTaskLogs < ActiveRecord::Migration
  def change
    create_table :task_logs do |t|
      t.integer :user_id
      t.string :name
      t.text :notes
      t.string :context

      t.timestamps
    end
  end
end
