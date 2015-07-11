require 'rails_helper'

RSpec.describe Project, type: :model do
  
  it {validate_presence_of(:name)}
  it {have_many(:notifications)}
  
  describe '#before_create' do
    
    it 'does generate a random uid' do
      project = Project.create(name: Faker::Name.name)
      
      expect(project.uid.nil?).to be_falsey
    end
    
  end
  
end
