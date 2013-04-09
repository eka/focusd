class AddCurrentContextIdToUser < ActiveRecord::Migration
  def up
    add_column :users, :current_context_id, :integer

    User.find_each do |user|
      user.update_column :current_context_id, user.contexts.find_by_name(Context::DEFAULT_CONTEXT_NAME).id
    end
  end

  def down
    remove_column :users, :current_context_id
  end
end
