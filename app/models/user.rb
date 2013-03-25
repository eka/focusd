class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :validatable,
  # :recoverable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  validates :email, presence: true, email: true, uniqueness: true
  has_many :contexts
  after_create :create_default_context

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
  end

  def create_default_context
    contexts.create(name: Context::DEFAULT_CONTEXT_NAME)
  end
end
