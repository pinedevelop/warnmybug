require 'rails_helper'

RSpec.describe NotificationCenter do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let!(:user_preference) {create(:user_preference, user_id: user.id, environment_id: project.environment.id)}
  let(:notification) { create(:notification, environment: project.environment) }
  let!(:browser_info) { create(:browser_info, notification: notification) }

  before(:each) do
    user.projects << project
  end

  describe '#notify' do
    describe 'for each user' do
      describe 'when user wanna receive email' do
      
        it 'does call notification mailer' do
          expect_any_instance_of(NotificationMailer).to receive(:notify).with(user, notification)

          NotificationCenter.new.notify(notification.id)
        end
        
      end
      
      describe 'when user dont wanna receive email' do
      
        it 'does dont call notification mailer' do
          user_preference.update(email: false)
          
          expect_any_instance_of(NotificationMailer).to_not receive(:notify)

          NotificationCenter.new.notify(notification.id)
        end
        
      end
    end
  end
end
