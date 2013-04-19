class Task < ActiveRecord::Base
  belongs_to :context
  acts_as_list scope: :context, add_new_at: :top
  validates :name, presence: true

  def done
    TaskLog.create_from_task(self)
    destroy
  end
end
