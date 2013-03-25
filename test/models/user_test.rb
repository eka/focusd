require "test_helper"

describe User do
  before do
    @user = create(:user)
  end

  it "must be valid" do
    @user.valid?.must_equal true
  end

  it "should not accept duplicate email" do
    proc { create(:user) }.must_raise(ActiveRecord::RecordInvalid)
  end

  it "must accept valid password" do
    @user.valid_password?("password").must_equal true
  end

  it "must have at least one context" do
    @user.contexts.size.must_equal 1
  end

  it "must have main context" do
    @user.contexts.first.name.must_equal 'main'
  end

end
