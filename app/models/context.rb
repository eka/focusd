class Context < ActiveRecord::Base
  DEFAULT_CONTEXT_NAME = 'main'
  belongs_to :user
  has_many :tasks, -> { order "position" }, dependent: :destroy

  validates :name, presence: true, :uniqueness => true

end
