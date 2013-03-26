class Task < ActiveRecord::Base
  belongs_to :context
  acts_as_list scope: :context
end
