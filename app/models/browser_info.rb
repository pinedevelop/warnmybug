class BrowserInfo < ActiveRecord::Base
  
  validates :notification_id, presence: true
  
  belongs_to :notification
end
