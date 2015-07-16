class UserPreference < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :environment
  
  def self.create_default!(user_id, environment_id)
    self.create!(user_id: user_id, environment_id: environment_id, email: true)
  end
  
end
