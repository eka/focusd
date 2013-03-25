class ContextsController < ApplicationController
  before_action :authenticate_user!

  def index
    context = Context.find_by_name('main')
    if context.tasks.empty?
      redirect_to new_context_task_path context
    else
      redirect_to edit_context_task_path context, context.tasks.first
    end
  end
end
