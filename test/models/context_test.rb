require "test_helper"

describe Context do
  before do
    @context = create(:context)
  end

  it "must be valid" do
    @context.valid?.must_equal true
  end

  it "must destroy all dependent tasks when deleted" do
    task_one = @context.tasks.create(name: 'foo', notes: 'bar')
    task_two = @context.tasks.create(name: 'foo2', notes: 'bar2')
    task_one.destroyed?.must_equal false
    task_two.destroyed?.must_equal false
    @context.destroy
    task_one.destroyed?.must_equal true
    task_two.destroyed?.must_equal true
  end

  it "must not create a new context with existing name" do
    new_context = Context.create(name: @context.name)
    new_context.valid?.must_equal false
  end
end
