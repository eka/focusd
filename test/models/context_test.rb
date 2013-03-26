require "test_helper"

describe Context do
  before do
    @context = create(:context)
  end

  it "must be valid" do
    @context.valid?.must_equal true
  end
end
