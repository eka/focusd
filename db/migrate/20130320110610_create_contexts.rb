class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
