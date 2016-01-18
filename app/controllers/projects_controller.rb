class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /projects
  # GET /projects.json
  def clean
      projects = Project.finished()
      projects.each do |project|
          project.update_attribute(:display,false)

      end

      redirect_to projects_url, notice: "projects cleaned"
  end
  def index
    @projects = Project.display().rank(:row_order).all
  end
  def update_row_order
    @project = Project.find(project_params[:id])
    @project.row_order_position = project_params[:row_order_position]
    @project.save

    render nothing: true
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end
  def search
      @q = "%#{params[:query]}%"
      @projects = Project.where("title LIKE ?",@q)
      render 'index'
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.tasks.build
  end

  # GET /projects/1/edit
  def edit
      @project.tasks.build
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def complete
      @project = Project.find(params[:id])
      if @project.finished?
           @project.update_attribute(:finished,false)
           @project.update_attribute(:finshed_at,nil)
      else
           @project.update_attribute(:finished,true)
           @project.update_attribute(:finshed_at,Time.now)
      end

      redirect_to projects_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:id,:title,:plan_finish_at,:finished,:display, tasks_attributes: [:id, :title, :content, :status, :_destroy])
    end
end
