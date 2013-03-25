class Context < ActiveRecord::Base
  DEFAULT_CONTEXT_NAME = 'main'
  has_many :tasks
end
