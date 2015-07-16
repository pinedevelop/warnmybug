class Environment < ActiveRecord::Base
  
  validates :name, :project_id, presence: true
  belongs_to :project
  has_many :notifications
  has_one :environment_preference
  
  before_create :generate_uid
  after_create :create_preference
  
  def generate_uid
    self.uid = loop do
      random_code = SecureRandom.hex(14).upcase
      break random_code unless Environment.exists?(uid: random_code)
    end
  end
  
  def create_preference
    EnvironmentPreference.create_default!(id)
  end

  def track?(notification_type)
    environment_preference[notification_type]
  end
  
end
