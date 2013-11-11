require "test_helper"

describe Context do
  before do
    @user1 = User.create(email: 'foo@foo.com', password: 'pass')
  end

  it "must be valid" do
    context = @user1.contexts.create(name: "Must be Valid")
    context.valid?.must_equal true
  end

  it "must destroy all dependent tasks when deleted" do
    context = @user1.contexts.create(name: "Must Destroy")
    task_one = context.tasks.create(name: 'foo', notes: 'bar')
    task_two = context.tasks.create(name: 'foo2', notes: 'bar2')
    task_one.destroyed?.must_equal false
    task_two.destroyed?.must_equal false
    context.destroy
    task_one.destroyed?.must_equal true
    task_two.destroyed?.must_equal true
  end

  it "must not create a new context with existing name" do
    context = @user1.contexts.create(name: "Existing Name")
    new_context = @user1.contexts.create(name: context.name)
    new_context.valid?.must_equal false
  end
end
