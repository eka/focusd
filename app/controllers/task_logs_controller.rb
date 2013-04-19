class TaskLogsController < ApplicationController
  before_action :set_task_log, only: [:show, :edit, :update, :destroy]

  # GET /task_logs
  # GET /task_logs.json
  def index
    @task_logs = TaskLog.all
  end

  # GET /task_logs/1
  # GET /task_logs/1.json
  def show
  end

  # GET /task_logs/new
  def new
    @task_log = TaskLog.new
  end

  # GET /task_logs/1/edit
  def edit
  end

  # POST /task_logs
  # POST /task_logs.json
  def create
    @task_log = TaskLog.new(task_log_params)

    respond_to do |format|
      if @task_log.save
        format.html { redirect_to @task_log, notice: 'Task log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task_log }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_logs/1
  # PATCH/PUT /task_logs/1.json
  def update
    respond_to do |format|
      if @task_log.update(task_log_params)
        format.html { redirect_to @task_log, notice: 'Task log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_logs/1
  # DELETE /task_logs/1.json
  def destroy
    @task_log.destroy
    respond_to do |format|
      format.html { redirect_to task_logs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_log
      @task_log = TaskLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_log_params
      params.require(:task_log).permit(:user_id, :name, :notes, :context)
    end
end
