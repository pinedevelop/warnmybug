require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) {create(:project)}
  let!(:notification) { create(:notification, environment_id: project.environment.id) }

  before(:each) do
    controller.request.env['HTTP_ACCEPT_LANGUAGE'] = %w(en pt).sample
    user.projects << project
    sign_in user
  end
  
  describe 'GET #show' do
    
    it 'does assign the environment to @environment' do
      xhr :get, :show, project_id: project.id, id: notification.id, environment_id: project.environment
      
      expect(assigns(:environment)).to eql(notification.environment)
    end
    
    it 'does assign the notification to @notification' do
      xhr :get, :show, project_id: project.id, id: notification.id, environment_id: project.environment
      
      expect(assigns(:notification)).to eql(notification)
    end
    
    it 'does render show' do
      xhr :get, :show, project_id: project.id, id: notification.id, environment_id: project.environment
      
      expect(response).to render_template(:show)
    end
    
  end
  
end
