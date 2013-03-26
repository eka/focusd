class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :validatable,
  # :recoverable and :omniauthable
  has_many :contexts
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  validates :email, presence: true, email: true, uniqueness: true
  after_create :create_default_context

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
  end

  def create_default_context
    contexts.create(name: Context::DEFAULT_CONTEXT_NAME)
  end
end
