class TasksController < ApplicationController
  before_action :get_context
  before_action :get_task, only: [:edit, :show, :update, :destroy]

  def new

  end

  def show
    redirect_to edit_context_task_url context_id: @context.id, id: @task.id
  end

  def edit
    not_found unless @task
  end

  def update
    not_found unless @task
    @task.update_attributes(task_params)
    redirect_to edit_context_task_url context_id: @context.id, id: @task.id
  end

  private
  def get_context
    @context = current_user.contexts.find_by_id(params[:context_id])
  end

  def get_task
    @task = @context ? @context.tasks.find_by_id(params[:id]) : nil
  end

  def task_params
    params.require(:task).permit(:title, :notes)
  end
end
