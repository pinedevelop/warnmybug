class UserPreferencesController < ApplicationController
  before_action :set_environment

  def update    
    current_user.preference(@environment.id).update!(user_preferences)
    
    redirect_to project_environment_path(@environment.project, @environment)
  end

  private

  def set_environment
    @environment = current_user.projects.find(params[:project_id]).environments.find(params[:environment_id])
  end
  
  def user_preferences
    params.require(:user_preference).permit(:email)
  end
  
  
end
