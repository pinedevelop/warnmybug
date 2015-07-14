require 'rails_helper'

RSpec.describe Project, type: :model do
  
  it { validate_presence_of(:name) }
  it { have_and_belong_to_many :projects }
  it { have_many :environments }
  
  describe '#after_create' do
    
    it 'does create a default environment' do
      expect {
        Project.create(name: Faker::Name.name)
      }.to  change(Environment, :count).by(1)
    end
    
    it 'does create production env' do
      project = Project.create(name: Faker::Name.name)
      
      expect(project.environments.first.name).to eql("production")
    end
    
  end
end
