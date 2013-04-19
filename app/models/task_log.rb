class TaskLog < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :context, presence: true

  def self.create_from_task(task)
    new_log = new(name: task.name, notes: task.notes, context: task.context.name, user_id: task.context.user.id)
    new_log.save
  end
end
