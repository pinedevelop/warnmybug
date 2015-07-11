class Notification < ActiveRecord::Base
  extend EnumerateIt
  
  has_enumeration_for :notification_type, required: true, create_helpers: true, create_scopes: true
  
  validate :project_id, presence: true
  
  belongs_to :project
end
