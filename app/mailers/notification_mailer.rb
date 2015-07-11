class NotificationMailer < ApplicationMailer
  
  def notify(user, notification)
    @user = user
    @notification = notification
    
    mail(to: user.email, subject: I18n.t('mailer.notification.subject', project: notification.project.name, type: notification.notification_type))
  end
  
end
