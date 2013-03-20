class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :notes
      t.integer :position
      t.integer :context_id

      t.timestamps
    end
  end
end
