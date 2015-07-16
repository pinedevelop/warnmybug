class Api::NotificationsController < ActionController::Base
  before_action :set_tenant

  def create
    if @environment.track?(params[:notification][:notification_type])
      
      notification = @environment.notifications.create(notification_params)

      browser_info = BrowserInfo.new(browser_params)
      browser_info.notification_id = notification.id

      browser_info.save
    end
    
    render nothing: true, status: 200
  end

  private

  def set_tenant
    @environment = Environment.find_by_uid(params[:uid])
  end

  def notification_params
    params.require(:notification).permit(:notification_type, :message, :url)
  end

  def browser_params
    params.require(:browser_info).permit(:app_code_name, :app_name, :app_version, :cookie_enabled,
                                         :hardware_concurrency, :language, :mime_types, :online, :platform, :plugins, :product, :product_sub, :user_agent, :vendor, :vendor_sub)
  end
end
