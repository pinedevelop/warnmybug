class EnvironmentPreference < ActiveRecord::Base
  belongs_to(:environment)
  
  validates :environment_id, presence: true
  
  def self.create_default!(environment_id)
    self.create(log: true, error: true, warn: true, environment_id: environment_id)
  end
  
end
