class SetUserPreferences < ActiveRecord::Migration
  def change
    User.unscoped.all.each do |user|
      user.projects.each do |project|
        project.environments.each do |env|
          UserPreference.create_default!(user.id, env.id)
        end
      end
    end
  end
end
