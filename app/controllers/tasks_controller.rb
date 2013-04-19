class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_context
  before_action :get_task

  def index
    @task = @context.tasks.first || @context.tasks.new
  end

  def new
    @task = @context.tasks.new
    redirect_to tasks_path
  end

  def show

  end

  def edit
    redirect_to tasks_path
  end

  def update
    if @task.update_attributes(task_params)
      form_action = params[:form_action].downcase
      case form_action
        when 'defer'
          @task.move_to_bottom
        when 'delete'
          @task.destroy
        when 'new'
          @task = @context.tasks.new
          render "new" and return
        when 'next'
          @task.move_lower
        when 'done'
          @task.done
      end
      redirect_to tasks_path
    else
      render "index"
    end
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
      @task = @context ? @context.tasks.first : nil
    end

    def get_context
      @context = current_user.current_context
    end

    def task_params
      params.require(:task).permit(:name, :notes)
    end
end
