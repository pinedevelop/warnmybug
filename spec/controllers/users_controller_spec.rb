require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let!(:project) { create(:project) }

  before(:each) do
    controller.request.env['HTTP_ACCEPT_LANGUAGE'] = %w(en pt).sample
    user.projects << project
    sign_in user
  end

  describe 'POST #create' do
    it 'does redirect to project' do
      post :create, project_id: project.id, user: { email: user.email }

      expect(response).to redirect_to(project_environment_path(project, project.environment))
    end
    
    it 'does create user preference if doesnt exists' do
      expect(UserPreference).to receive(:create_default!).once
      
      post :create, project_id: project.id, user: { email: user.email}
    end
    
    it 'does associate project to @project' do
      post :create, project_id: project.id, user: { email: user.email }

      expect(assigns(:project)).to eql(project)
    end

    describe 'when user doesnt exists' do
      let(:returned_user) { create(:user) }

      it 'does invite new user' do
        email = 'admin@admin.com'

        expect(User).to receive(:invite!).with(email: email).and_return(returned_user)

        post :create, project_id: project.id, user: { email: email }
      end

      it 'does associate project to invited user' do
        allow(User).to receive(:invite!).and_return(returned_user)

        post :create, project_id: project.id, user: { email: 'user@user.com' }

        expect(returned_user.projects.count).to eql(1)
        expect(returned_user.projects.first.id).to eql(project.id)
      end
    end

    describe 'when user exists' do
      describe 'and already is associated to project' do
        it 'does ignore the association' do
          post :create, project_id: project.id, user: { email: user.email }

          expect(user.projects.count).to eql(1)
        end
      end

      describe 'and doesnt has project association' do
        let(:leonardo) { create(:user) }

        it 'does associate the project' do
          post :create, project_id: project.id, user: { email: leonardo.email }

          expect(leonardo.reload.projects.count).to eql(1)
        end
      end
    end
  end
end
