require 'rails_helper'

RSpec.describe EnvironmentsController, type: :controller do
  
  let(:user) { create(:user) }
  let(:other_user) {create(:user)}
  let(:project) { create(:project) }

  before(:each) do
    user.projects << project
    other_user.projects << project
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
  
  describe 'GET #new' do
    it 'does be success' do
      get :new, project_id: project.to_param
      
      expect(response).to be_success
    end
    
    it 'does assigns the environment project as @project' do
      get :new, project_id: project.to_param
      
      expect(assigns(:project)).to eq(project)
    end
    
    it 'does assigns new environment as @environment' do
      get :new, project_id: project.to_param
      
      expect(assigns(:environment)).to be_a_instance_of(Environment)
    end
    
    it 'does render new template' do
      get :new, project_id: project.to_param
      
      expect(response).to render_template(:new)
    end
    
  end
  
  describe 'POST #create' do
    
    describe 'with valid params' do
      let(:valid_params) {attributes_for(:environment)}
      
      it 'does redirect to environment' do
        post :create, project_id: project.id, environment: valid_params
        
        expect(response).to redirect_to(project_environment_path(project, assigns(:environment)))
      end
      
      it 'does create environment' do
        expect {
          post :create, project_id: project.id, environment: valid_params
        }.to change(Environment, :count).by(1)
      end
      
      it 'does create preference for each user' do
        expect(UserPreference).to receive(:create_default!).twice
        
        post :create, project_id: project.id, environment: valid_params
      end
      
    end
    
    describe 'with invalid params' do
      
      it 'does render new' do
        post :create, project_id: project.id, environment: {name: ""}
        
        expect(response).to render_template(:new)
      end
      
    end
    
  end
  
end
