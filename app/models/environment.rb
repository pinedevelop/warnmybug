class Environment < ActiveRecord::Base
  
  validates :name, :project_id, presence: true
  belongs_to :project
  has_many :notifications
  
  before_create :generate_uid

  def generate_uid
    self.uid = loop do
      random_code = SecureRandom.hex(14).upcase
      break random_code unless Environment.exists?(uid: random_code)
    end
  end
  
end
