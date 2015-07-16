require 'rails_helper'

RSpec.describe UserPreference, type: :model do
  
  it {belong_to(:user)}
  it {belong_to(:environment)}
  
  describe '.create_default' do
    
    it 'does save email with true' do
       preference = UserPreference.create_default!(1, 1)
      
      expect(preference.email).to eql(true)
    end
    
  end
  
end
