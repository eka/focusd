require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  before do
    @user = create(:user)
  end
  describe 'User' do
    it "Must redirect to main context after signin" do
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "password"
      click_button "Sign in"
      page.must_have_content('Contexts')
    end


  end
end
