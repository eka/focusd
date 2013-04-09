class TasksController < ApplicationController
  before_action :get_context
  before_action :get_task, only: [:edit, :show, :update, :destroy, :defer]

  def index
    respond_with @context.tasks
  end

  def new
    @task = @context.tasks.new
    respond_with @task
  end

  def show
    respond_with @task
  end

  def edit
  end

  def update
    @task.update_attributes(task_params)
    respond_with @task
  end

  def create
    @task = @context.tasks.new(task_params)

    if @task.save
      redirect_to edit_context_task_url context_id: @context.id, id: @task.id
    else
      render action: 'new'
    end
  end

  def defer
    @task.move_to_bottom
    respond_with @context.tasks.first
  end

  def destroy
    @task.destroy
    if @context.tasks.empty?
      redirect_to context_tasks_url context_id: @context.id
    else
      redirect_to edit_context_task_url context_id: @context.id, id: @context.tasks.first.id
    end
  end

  def current
    respond_with @context.tasks.first
  end

  private
    def get_task
      @task = @context ? @context.tasks.find_by_id(params[:id]) : nil
      not_found unless @task
    end

    def get_context
      @context = current_user.contexts.find_by_id(params[:context_id])
    end

    def task_params
      params.require(:task).permit(:name, :notes)
    end
end
