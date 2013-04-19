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

  it "must create a log for task" do
    @context.tasks.must_be_empty
    new_task = @context.tasks.create(name: 'test', notes: 'notes')
    patch :update, context_id: @context.id, id: new_task.id, :form_action => "done", task: { id: new_task.id } 
    Task.count.must_equal 0
    @user.task_logs.size.must_equal 1
    task_log = TaskLog.first
    task_log.name.must_equal 'test'
    task_log.context.must_equal 'main'
  end
end
