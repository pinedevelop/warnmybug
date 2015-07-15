require 'rails_helper'

RSpec.describe EnvironmentPreferencesController, type: :controller do
  
  let(:environment_preference) {create(:environment_preference)}
  let(:user) { create(:user) }
  
  before(:each) do
    user.projects << environment_preference.environment.project
    sign_in user
  end
  
  describe 'PUT #update' do
    
    it 'does assigns environment as @environment' do
      put :update, project_id: environment_preference.environment.project.id, 
          environment_id: environment_preference.environment.id, id: environment_preference.id, 
          environment_preference: {log: true, warn: true, error: false} 
          
      expect(assigns(:environment)).to eql(environment_preference.environment)
    end
    
    it 'does update environment preference' do
      put :update, project_id: environment_preference.environment.project.id, 
          environment_id: environment_preference.environment.id, id: environment_preference.id, 
          environment_preference: {log: true, warn: true, error: false} 
          
      expect(assigns(:environment).environment_preference.log).to eql(true)
    end
    
    it 'does redirect to environment show' do
      put :update, project_id: environment_preference.environment.project.id, 
          environment_id: environment_preference.environment.id, id: environment_preference.id, 
          environment_preference: {log: false, warn: true, error: false} 
          
      expect(response).to redirect_to(project_environment_path(environment_preference.environment.project, environment_preference.environment))
    end
    
  end
  
end
