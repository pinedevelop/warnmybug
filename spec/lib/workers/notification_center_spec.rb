require 'rails_helper'

RSpec.describe NotificationCenter do
  
  let(:user) {create(:user)}
  let(:project) {create(:project)}
  let(:notification) {create(:notification, project: project)}
  let!(:browser_info) {create(:browser_info, notification: notification)}
  
  before(:each) do
    user.projects << project
  end
  
  describe "#notify" do
    
    describe 'for each user' do
      
      it "does call notification mailer" do
        expect_any_instance_of(NotificationMailer).to receive(:notify).with(user, notification)
        
        NotificationCenter.new.notify(notification.id)
      end
      
    end
  end
  
end
