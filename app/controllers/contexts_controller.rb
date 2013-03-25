class ContextsController < ApplicationController
  before_action :authenticate_user!

  def index
    context = Context.find_by_name('main')
    redirect_to new_context_task_path context
  end
end
