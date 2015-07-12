class UsersController < ApplicationController
  before_action :set_project

  def create
    user = User.find_by_email(params[:user][:email])
    user = User.invite!(email: params[:user][:email]) unless user
    
    user.projects << @project unless @project.users.exists?(id: user.id)
    
    redirect_to @project
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end
