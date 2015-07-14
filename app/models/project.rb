class Project < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :users
  has_many :environments
  
  after_create :create_default_env
  
  def create_default_env
    environments.create!(name: :production)
  end
  
  def environment
    #TODO: return the default environment
    environments.first
  end
  
end
