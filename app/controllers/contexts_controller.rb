class ContextsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to tasks_path
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
    new_context = current_user.contexts.new(context_params)
    if new_context.save
      current_user.update_attribute(:current_context_id, new_context.id) unless new_context.nil?
      options = { notice: "Context succesfully created" }
    else
      options = { alert: "Can't create context with the name of #{context_params[:name]}" }
    end
    redirect_to tasks_path, options
  end

  def destroy
    if current_user.destroy_context(params[:id])
      options = { notice: "Context deleted" }
    else
      options = { alert: "You can't delete the last context" }
    end
    redirect_to tasks_path, options
  end

  private
  def context_params
    params.require(:context).permit(:name)
  end
end
