require "test_helper"

describe TasksController do

  before do
    @user = create(:user)
    @context = @user.contexts.first
    sign_in @user
  end

  it "must create a new task" do
    @context.tasks.must_be_empty
    post :create, context_id: @context.id, task: {'name' => 'foo', 'notes' => 'bar'}
    @context.tasks.size.must_equal 1
    task = @context.tasks.first
    task.name.must_equal 'foo'
    task.notes.must_equal 'bar'
  end
end
