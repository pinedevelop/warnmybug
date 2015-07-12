require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  
  let(:user) {create(:user)}
  let!(:project) {create(:project)}
  
  before(:each) do
    controller.request.env['HTTP_ACCEPT_LANGUAGE'] = ['en', 'pt'].sample
    user.projects << project
    sign_in user
  end
  
  describe "GET #index" do
    it "assigns all projects as @projects" do
      get :index
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #show" do
    it "assigns the requested project as @project" do
      get :show, id: project.to_param
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    it "assigns a new project as @project" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do
    it "assigns the requested project as @project" do
      get :edit, id: project.to_param
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      
      let(:valid_attributes) {attributes_for(:project)}
      
      it "creates a new Project" do
        expect {
          post :create, project: valid_attributes
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, project: valid_attributes
        
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it "redirects to the created project" do
        post :create, project: valid_attributes
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create, project: {name: ""}
        expect(assigns(:project)).to be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        post :create, project: {name: ""}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {name: Faker::Name.name} }

      it "updates the requested project" do
        put :update, id: project.to_param, project: new_attributes
        project.reload
        expect(project.name).to eql(new_attributes[:name])
      end

      it "assigns the requested project as @project" do
        put :update, id: project.to_param, project: {name: Faker::Name.name}
        expect(assigns(:project)).to eq(project)
      end

      it "redirects to the project" do
        put :update, id: project.to_param, project: {name: Faker::Name.name}
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        put :update, id: project.to_param, project: {name: ""}
        expect(assigns(:project)).to eq(project)
      end

      it "re-renders the 'edit' template" do
        put :update, id: project.to_param, project: {name: ""}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      expect {
        delete :destroy, id: project.to_param
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      delete :destroy, id: project.to_param
      expect(response).to redirect_to(projects_url)
    end
  end

end
