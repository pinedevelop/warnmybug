module ProjectsHelper
  def last_update_to(project)
    if project.notifications.any?
      l project.notifications.last.updated_at, format: :short
    else
      t('messages.never_used')
    end
  end
end
