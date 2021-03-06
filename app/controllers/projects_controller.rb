class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :get_claimant, only: [:create, :update]

  # GET /projects
  # GET /projects.json
  def index
    @view_items = params[:status] ? params[:status] : 'P'

    respond_to do |format|
      format.html { @projects = Project.where("status LIKE '#{@view_items}%'") }
      format.json { @projects = Project.where("status LIKE 'A%'") }
    end

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
      @project.claimant_id = @project.claimant.first_name + ' ' + @project.claimant.last_name
    end

    def get_claimant
      full_name = project_params[:claimant_id].split(' ')
      claimant = Claimant.where(:first_name => full_name[0], :last_name => full_name[1]).take
      params[:project][:claimant_id] = claimant.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :nameplate, :address, :post_code, :country, :install_date, :claimant_id)
    end
end