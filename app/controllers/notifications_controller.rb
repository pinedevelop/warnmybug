class NotificationsController < ApplicationController
  before_action :set_environment

  def show
    @notification = @environment.notifications.find(params[:id])
  end

  private

  def set_environment
    @environment = current_user.projects.find(params[:project_id]).environments.find(params[:environment_id])
  end
end
