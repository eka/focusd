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

  it "must update a task" do
    task = @context.tasks.create(name: 'foo', notes: 'bar')
    put :update, context_id: @context.id, task: {'name' => 'foo2'}, id: task.id
    @context.tasks.first.name.must_equal 'foo2'
  end

  it "must redirect to new task" do
    get :index, context_id: @context.id
    assert_redirected_to new_context_task_url, context_id: @context.id
  end

  it "must redirect to second task when deferring first" do
    task_one = @context.tasks.create(name: 'one', notes: 'one')
    task_two = @context.tasks.create(name: 'two', notes: 'two')
    task_one.reload
    task_two.reload
    @context.tasks.first.must_equal task_two
    @context.tasks.last.must_equal task_one

    post :defer, context_id: @context.id, id: @context.tasks.first.id
    assert_redirected_to edit_context_task_url context_id: @context.id, id: task_one.id
  end

  it "must delete task and be redirected to the next one in line" do
    task_one = @context.tasks.create(name: 'one', notes: 'one')
    task_two = @context.tasks.create(name: 'two', notes: 'two')
    @context.tasks.size.must_equal 2
    current_task = @context.tasks.first
    delete :destroy, context_id: @context.id, id: current_task.id
    assert_redirected_to edit_context_task_url context_id: @context.id, id: @context.tasks.first.id
    @context.tasks.size.must_equal 1
  end

  it "must redirect to new task when last task is deleted" do
    task_one = @context.tasks.create(name: 'one', notes: 'one')
    delete :destroy, context_id: @context.id, id: task_one.id
    assert_redirected_to context_tasks_url context_id: @context.id
    @context.tasks.size.must_equal 0
  end
end
