module ProjectsHelper
  def last_update_to(env)
    if env.notifications.any?
      l env.notifications.last.updated_at, format: :short
    else
      t('messages.never_used')
    end
  end
end
