class Task < ActiveRecord::Base
  belongs_to :context
  acts_as_list scope: :context, add_new_at: :top
  validates :name, presence: true

end
