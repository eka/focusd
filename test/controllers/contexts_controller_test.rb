require "test_helper"

describe ContextsController do
  before do
    @user = create(:user)
  end

  it "must return redirect to login when no session" do
    get :index
    assert_redirected_to new_user_session_url
  end

  it "must redirect to new task when logged in" do
    sign_in @user
    get :index
    assert_redirected_to new_context_task_path @user.contexts.first.id
  end


end