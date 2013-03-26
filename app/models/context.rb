class Context < ActiveRecord::Base
  DEFAULT_CONTEXT_NAME = 'main'
  belongs_to :user
  has_many :tasks, -> { order "position" }

  validates :name, presence: true
end
