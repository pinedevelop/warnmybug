require 'rails_helper'

RSpec.describe EnvironmentPreference, type: :model do
  
  it {belong_to :environment}
  it {validate_presence_of :environment_id}
  it {validate_presence_of :track}
  
  
  describe '.create_default' do
    
    it 'does save log with true' do
      environment_preference = EnvironmentPreference.create_default!(1)
      
      expect(environment_preference.log).to eql(true)
    end
    
    it 'does save warn with true' do
      environment_preference = EnvironmentPreference.create_default!(1)
      
      expect(environment_preference.warn).to eql(true)
    end
    
    it 'does save warn with true' do
      environment_preference = EnvironmentPreference.create_default!(1)
      
      expect(environment_preference.error).to eql(true)
    end
    
  end
  
end
