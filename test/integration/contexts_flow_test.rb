require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "ContextsFlow Integration Test" do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  before do
    @user = create(:user, email: "test@test.com", password: "secret")
  end

  def sign_in_user(email, password)
    visit new_user_session_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end

  it "must delete a context" do
    sign_in_user(@user.email, "secret")
    @user.contexts.count.must_equal 1
    new_context = @user.contexts.create(name: 'delete')
    @user.contexts.count.must_equal 2
    delete_via_redirect context_path(new_context)
    response.code.must_equal "200"
  end
end
