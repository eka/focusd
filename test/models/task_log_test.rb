require "test_helper"

describe TaskLog do
  before do
    @task = create(:task)
  end

  it "must be valid" do
    @task.valid?.must_equal true
  end

  it "must create a tasklog" do
    TaskLog.all.must_be_empty
    name = @task.name
    tid = @task.id
    @task.done
    TaskLog.find_by_name(name).wont_be_nil
    proc { Task.find(tid) }.must_raise ActiveRecord::RecordNotFound
    TaskLog.count.must_equal 1
    Task.count.must_equal 0
  end
end
