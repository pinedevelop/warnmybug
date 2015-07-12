require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { belong_to :project }
  it { have_many :browser_info }
  it { validate_presence_of :name }
  it { validate_presence_of :project_id }

  describe '#notify' do
    let(:notification) { create(:notification) }

    it 'does call notification center with id' do
      expect_any_instance_of(NotificationCenter).to receive(:notify)

      notification
    end
  end
end
