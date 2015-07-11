class Api::NotificationsController < ActionController::Base
  
  before_action :set_tenant
  
  def create
    notification = @project.notifications.create(notification_params)
    
    render nothing: true, status: 200
  end
  
  private
  
  def set_tenant
    @project = Project.find_by_uid(params[:uid])
  end
  
  def notification_params
    params.require(:notification).permit(:notification_type, :message, :url)
  end
  
end