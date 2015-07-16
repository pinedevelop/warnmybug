require 'rails_helper'

RSpec.describe User, type: :model do
  it { have_and_belong_to_many :projects }
  it {have_many :user_preferences}
  
  describe '#preference' do
    
    let(:user) {create(:user)}
    let(:environment) {create(:environment)}
    
    it 'does load user preferences by environment id' do
      up = UserPreference.create_default!(user.id, environment.id)
      
      expect(user.preference(environment.id)).to eql(up)
    end
    
  end
  
end
