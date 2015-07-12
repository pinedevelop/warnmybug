class Project < ActiveRecord::Base
  validates :name, presence: true

  has_many :notifications
  has_and_belongs_to_many :users

  before_create :generate_uid

  def generate_uid
    self.uid = loop do
      random_code = SecureRandom.hex(14).upcase
      break random_code unless Project.exists?(uid: random_code)
    end
  end
end
