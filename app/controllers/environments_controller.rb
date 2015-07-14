class EnvironmentsController < ApplicationController
  before_action :set_project
  
  def show
    @environment = @project.environments.find(params[:id])
  end
  
  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

end
