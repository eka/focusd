class ContextsController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_with current_user.contexts
  end

  def show
    respond_with current_user.contexts.find_by_id(params[:id])
  end

  def current
    context = current_user.contexts.find_by_id(params[:id])
    current_user.update_attribute(:current_context_id, context.id)
    redirect_to tasks_path
  end

  def create
    new_context = current_user.contexts.create(context_params)
    current_user.update_attribute(:current_context_id, new_context.id)
    redirect_to tasks_path
  end

  private
  def context_params
    params.require(:context).permit(:name)
  end
end
