class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects
  has_many :user_preferences
  
  def preference(environment_id)
    UserPreference.find_by_user_id_and_environment_id(id, environment_id)
  end
end
