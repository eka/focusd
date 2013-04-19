class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :validatable,
  # :recoverable and :omniauthable
  has_many :contexts
  has_many :task_logs
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  validates :email, presence: true, email: true, uniqueness: true
  after_create :create_default_context

  def current_context
    contexts.find_by_id(current_context_id)
  end

  def default_context
    contexts.find_by_name(Context::DEFAULT_CONTEXT_NAME)
  end

  def destroy_context(context_id)
    if contexts.count > 1
      contexts.find(context_id).destroy
      update_attribute(:current_context_id, contexts.first.id)
      true
    else
      false
    end
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
