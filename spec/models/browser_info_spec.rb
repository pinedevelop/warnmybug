require 'rails_helper'

RSpec.describe BrowserInfo, type: :model do
  it { validate_presence_of :notification_id }
  it { belong_to :notification }
end
