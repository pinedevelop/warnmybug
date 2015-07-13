class NotificationsController < ApplicationController
  before_action :set_project

  def show
    @notification = @project.notifications.find(params[:id])
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end
end
