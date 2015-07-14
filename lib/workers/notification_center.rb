class NotificationCenter
  def notify(notification_id)
    notification = Notification.find(notification_id)
    
    notification.environment.project.users.each do |user|
      NotificationMailer.notify(user, notification).deliver_now
    end
  end

  handle_asynchronously :notify
end
