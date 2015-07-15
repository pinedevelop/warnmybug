class SetEnvPreferences < ActiveRecord::Migration
  def change
    
    Environment.unscoped.all.each do |environment|
      EnvironmentPreference.create_default!(environment.id)
    end
    
  end
end
