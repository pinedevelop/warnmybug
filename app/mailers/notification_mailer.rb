class NotificationMailer < ApplicationMailer
  def notify(user, notification)
    @user = user
    @notification = notification

    mail(to: user.email, subject: I18n.t('mailer.notification.subject', 
      project: notification.environment.project.name, type: notification.notification_type, environment: notification.environment.name))
  end
end
