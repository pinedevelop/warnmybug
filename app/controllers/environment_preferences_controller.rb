class EnvironmentPreferencesController < ApplicationController
  before_action :set_environment

  def update
    @environment.environment_preference.update!(environment_preference_params)
    redirect_to project_environment_path(@environment.project, @environment)
  end

  private

  def set_environment
    @environment = current_user.projects.find(params[:project_id]).environments.find(params[:environment_id])
  end
  
  def environment_preference_params
    params.require(:environment_preference).permit(:log, :warn, :error)
  end
  
end
