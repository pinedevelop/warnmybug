require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let(:user) { create(:user) }
  let!(:notification) { create(:notification) }

  before(:each) do
    controller.request.env['HTTP_ACCEPT_LANGUAGE'] = %w(en pt).sample
    user.projects << notification.project
    sign_in user
  end
  
  describe 'GET #show' do
    
    it 'does assign the project to @project' do
      xhr :get, :show, project_id: notification.project.id, id: notification.id
      
      expect(assigns(:project)).to eql(notification.project)
    end
    
    it 'does assign the notification to @notification' do
      xhr :get, :show, project_id: notification.project.id, id: notification.id
      
      expect(assigns(:notification)).to eql(notification)
    end
    
    it 'does render show' do
      xhr :get, :show, project_id: notification.project.id, id: notification.id
      
      expect(response).to render_template(:show)
    end
    
  end
  
end
