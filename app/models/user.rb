class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :validatable,
  # :recoverable and :omniauthable
  has_many :contexts
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  validates :email, presence: true, email: true, uniqueness: true
  after_create :create_default_context

  def current_context
    contexts.find_by_id(current_context_id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
  end

  def create_default_context
    new_context = contexts.create(name: Context::DEFAULT_CONTEXT_NAME)
    update_attribute(:current_context_id, new_context.id)
  end
end
