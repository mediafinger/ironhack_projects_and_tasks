class ProjectsController < ApplicationController

  def index
    @projects = Project.all

    if params[:status].present?
      @projects = @projects.select { |project| project.status == params[:status] }
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_url, notice: 'Project was successfully created.'
    else
      render :new
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params[:project].permit(:name)
    end
end
