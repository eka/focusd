require "test_helper"

describe ContextsController do
  before do
    @user = create(:user)
  end

  it "must return redirect to login when no session" do
    get :index
    assert_redirected_to new_user_session_path
  end

  it "must redirect to new task when logged in" do
    sign_in @user
    get :index
    assert_redirected_to tasks_path
  end

  it "must destroy any context but last" do
    sign_in @user
    main = @user.default_context
    @user.contexts.count.must_equal 1
    delete :destroy, id: main.id
    @user.contexts.count.must_equal 1
    new_context = @user.contexts.create(name: 'new')
    @user.contexts.count.must_equal 2
    delete :destroy, id: new_context
    @user.contexts.count.must_equal 1
    assert_redirected_to tasks_path
  end
end
