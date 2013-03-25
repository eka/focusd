require "test_helper"

describe HomeController do
  it "must get index" do
    get :index
    assert_response :success
  end

end
