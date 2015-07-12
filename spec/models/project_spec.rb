require 'rails_helper'

RSpec.describe Project, type: :model do
  it { validate_presence_of(:name) }
  it { have_many(:notifications) }
  it { have_and_belong_to_many :projects }

  describe '#before_create' do
    it 'does generate a random uid' do
      project = Project.create(name: Faker::Name.name)

      expect(project.uid.nil?).to be_falsey
    end
  end
end
