class Notification < ActiveRecord::Base
  extend EnumerateIt

  has_enumeration_for :notification_type, required: true, create_helpers: true, create_scopes: true

  validates :environment_id, presence: true

  belongs_to :environment
  has_one :browser_info

  after_create :notify

  def notify
    NotificationCenter.new.notify(id)
  end
end
