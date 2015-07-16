class EnvironmentsController < ApplicationController
  before_action :set_project
  
  def new
    @environment = Environment.new
  end
  
  def create
    @environment = @project.environments.new(environment_params)
    
    if @environment.save
      @project.users.each do |user|
        UserPreference.create_default!(user.id, @environment.id)
      end
    
      redirect_to project_environment_path(@project, @environment)
    else
      render :new
    end
  end
  
  def show
    @environment = @project.environments.find(params[:id])
  end
  
  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
  
  def environment_params
    params.require(:environment).permit(:name)
  end

end
