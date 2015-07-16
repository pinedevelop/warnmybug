require 'rails_helper'

RSpec.describe UserPreferencesController, type: :controller do
  
  let(:user_preference) {create(:user_preference)}
  
  before(:each) do
    user_preference.user.projects << user_preference.environment.project
    sign_in user_preference.user
  end
  
  describe 'PUT #update' do
    
    it 'does assigns environment as @environment' do
      put :update, project_id: user_preference.environment.project.id, 
          environment_id: user_preference.environment.id, id: user_preference.id, 
          user_preference: {email: true} 
          
      expect(assigns(:environment)).to eql(user_preference.environment)
    end
    
    it 'does update environment preference' do
      put :update, project_id: user_preference.environment.project.id, 
          environment_id: user_preference.environment.id, id: user_preference.id, 
          user_preference: {email: false} 
          
      expect(user_preference.reload.email).to eql(false)
    end
    
    it 'does redirect to environment show' do
      put :update, project_id: user_preference.environment.project.id, 
          environment_id: user_preference.environment.id, id: user_preference.id, 
          user_preference: {email: false} 
          
      expect(response).to redirect_to(project_environment_path(user_preference.environment.project, user_preference.environment))
    end
    
  end
end
