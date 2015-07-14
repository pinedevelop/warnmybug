class ChangeNotificationsProjectIdToEnvironmentId < ActiveRecord::Migration
  def change
    rename_column :notifications, :project_id, :environment_id
  end
end
