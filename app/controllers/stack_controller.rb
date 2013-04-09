class StackController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        current_context = current_user.current_context
        current_task = current_context.tasks.first
        render json: { context_id: current_context.id, task_id: current_task.id }
      end
      format.html {}
    end

  end
end
