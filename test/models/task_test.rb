require "test_helper"

describe Task do
  before do
    @context = create(:context)
    @task = @context.tasks.create(name: "task 1")
  end

  it "must be valid" do
    @task.valid?.must_equal true
  end

  it "must have a position" do
    @task.position.must_equal 1
  end

  it "must be inserted at top" do
    new_task = @context.tasks.create(name: "new task")
    new_task.position.must_equal 1
    @task.reload
    @task.position.must_equal 2
    @context.tasks.size.must_equal 2
  end
end
