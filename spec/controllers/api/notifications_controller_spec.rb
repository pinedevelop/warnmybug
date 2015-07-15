require 'rails_helper'

RSpec.describe Api::NotificationsController, type: :controller do
  
  let(:environment) {create(:environment)}
  
  describe 'POST #create' do
    
    let(:notification_attrs) {attributes_for(:notification)}
    let(:browser_info_attrs) {attributes_for(:browser_info)}
    
    describe 'when has environment' do
    
      it 'does be success' do
        post :create, notification: notification_attrs, browser_info: browser_info_attrs, uid: environment.uid
      
        expect(response).to be_success
      end
    
      it 'does assigns environment to @environment' do
        post :create, notification: notification_attrs, browser_info: browser_info_attrs, uid: environment.uid
      
        expect(assigns(:environment)).to eql(environment)
      end
    
      it 'does create notification' do
        expect {
          post :create, notification: notification_attrs, browser_info: browser_info_attrs, uid: environment.uid
        }.to change(Notification, :count).by(1)
      end
    
      it 'does create browser info' do
        expect {
          post :create, notification: notification_attrs, browser_info: browser_info_attrs, uid: environment.uid
        }.to change(BrowserInfo, :count).by(1)
      end
    end
    
    describe 'when hasnt environment' do
      
      it 'does be success' do
        post :create, notification: notification_attrs, browser_info: browser_info_attrs, uid: ""
      
        expect(response).to be_success
      end
    end
    
  end
  
end