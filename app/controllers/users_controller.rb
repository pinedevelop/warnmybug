class UsersController < ApplicationController
  before_action :set_project

  def create
    user = User.find_by_email(params[:user][:email])
    user = User.invite!(email: params[:user][:email]) unless user

    user.projects << @project unless @project.users.exists?(id: user.id)
    
    @project.environments.each do |env|
      UserPreference.create_default!(user.id, env.id) unless user.user_preferences.exists?(environment_id: env.id)
    end

    redirect_to project_environment_path(@project, @project.environment)
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end
