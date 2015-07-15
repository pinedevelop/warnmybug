require 'rails_helper'

RSpec.describe EnvironmentsController, type: :controller do
  
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  before(:each) do
    user.projects << project
    sign_in user
  end
  
  describe 'GET #show' do
    
    it 'does assigns the environment project as @project' do
      get :show, project_id: project.to_param, id: project.environment.id
      expect(assigns(:project)).to eq(project)
    end
    
    it 'dies assigns the requested environment as @environment' do
      get :show, project_id: project.to_param, id: project.environment.id
      expect(assigns(:environment)).to eq(project.environment)
    end
  end
  
end
