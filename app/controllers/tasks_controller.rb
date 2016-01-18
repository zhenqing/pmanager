class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tasks
  # GET /tasks.json
  def clean
      tasks = Task.finished()
      tasks.each do |task|
          task.update_attribute(:display,false)

      end

      redirect_to tasks_url, notice: " task cleaned"
  end
  def index
    @tasks = Task.display().order(params[:sort]).rank(:row_order).paginate(:page => params[:page], :per_page => 4)

  end
  def update_row_order
    @task = Task.find(task_params[:id])
    @task.row_order_position = task_params[:row_order_position]
    @task.save

    render nothing: true
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end
  def search
      @q = "%#{params[:query1]}%"
      @tasks = Task.where("title LIKE ? or content LIKE ?",@q,@q)
      render 'index'
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
      @task = Task.find(params[:id])
      if @task.finished?
           @task.update_attribute(:finished,false)
           @task.update_attribute(:finshed_at,nil)
      else
           @task.update_attribute(:finished,true)
           @task.update_attribute(:finshed_at,Time.now)
      end

      redirect_to tasks_url, notice: "task completed"
  end
  def clean
      @tasks = Task.finished()
      @tasks.each do |task|
          task.update_attribute(:display,false)

      end

      redirect_to tasks_url, notice: "tasks cleaned"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:id, :title, :content, :status, :row_order_position, :project_id, :plan_finish_at, :finished, :display)
    end
end
