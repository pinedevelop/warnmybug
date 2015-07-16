require 'rails_helper'

RSpec.describe Environment, type: :model do
  
  it {validate_presence_of(:name)}
  it {validate_presence_of(:project_id)}
  
  it {belong_to(:project)}
  it {have_many(:notifications)}
  it {have_one(:environment_setting)}
    
  describe '#before_create' do
    it 'does generate a random uid' do
      env = Environment.create(name: Faker::Name.name, project_id: 1)
      expect(env.uid.nil?).to be_falsey
    end
  end
  
  describe '#after_create' do
    
    it 'does create a preference with default values' do
      expect(EnvironmentPreference).to receive(:create_default!).with(1).once
      
      Environment.create(name: Faker::Name.name, project_id: 1)
    end
    
  end
  
  describe '#track?' do
    
    let(:environment) {create(:environment)}
    
    it 'does return true according to preference' do
      expect(environment.track?(NotificationType::LOG)).to eql(true)
    end
    
    it "does return false according to preference" do
      environment.environment_preference.update(log: false, warn: true, error: false)
      
      expect(environment.track?(NotificationType::ERROR)).to eql(false)
    end
  end
  
end
