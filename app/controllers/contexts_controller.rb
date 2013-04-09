class ContextsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    respond_with current_user.contexts
  end

  def show
    respond_with current_user.contexts.find_by_id(params[:id])
  end

  def current
    respond_with current_user.current_context
  end
end
