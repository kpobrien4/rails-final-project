class ProjectsController < ApplicationController
  before_action :redirect_if_not_signed_in
  before_action :set_user
  before_action :set_project, except: [:index, :new, :create]

  def index
    @projects = Project.search(params[:query])
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = @user.projects.build(project_params)
    if @project.save
      redirect_to projects_path
    else
      flash[:notify] = @project.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to projects_path unless current_user == @project.user
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      flash[:notify] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    if current_user == @project.user
    @project.destroy
    else 
      flash[:alert] = "You are not authorized to do that"
    end
    redirect_to projects_path
  end

  private

    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    def set_project
      @project = Project.find_by_id(params[:id])
    end


    def project_params
      params.require(:project).permit(:title, :genre, :info, :contact, :user_id)
    end

end
