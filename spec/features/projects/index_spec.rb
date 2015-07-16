require 'rails_helper'

RSpec.describe "Project index", type: :feature, js: true do
  let(:user) {create(:user)}
  
  before(:each) do
    create_list(:project, 5)
    user.projects << Project.limit(3)
    login_as user
    visit projects_path
  end
    

  describe "layout" do
    xit "does have title" do
      within "h3" do
        expect(page).to have_content("Meus projetos")
      end
    end
    
    it 'does have link to new project' do
      within '.add-project' do
        expect(page).to have_content("Novo")
      end
    end
    
  end
  
  describe "behavior" do
    
    describe 'when click new' do
    
      xit "does send to projects form" do
        click_link 'Novo'
        expect(page).to have_content("Novo projeto")
      end
      
    end
    
    describe 'project list' do
      xit 'does display associated user projects' do
        expect(page).to have_selector('.thumbnail', count: 4)
      end
    end
    
    describe 'project card' do
      
    end
    
  end

end