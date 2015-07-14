require 'rails_helper'

RSpec.describe Environment, type: :model do
  
  it {validate_presence_of(:name)}
  it {validate_presence_of(:project_id)}
  
  it {belong_to(:project)}
  it {have_many(:notifications)}
    
  describe '#before_create' do
    it 'does generate a random uid' do
      env = Environment.create(name: Faker::Name.name, project_id: 1)
      expect(env.uid.nil?).to be_falsey
    end
  end
end
