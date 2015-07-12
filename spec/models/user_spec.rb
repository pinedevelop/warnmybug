require 'rails_helper'

RSpec.describe User, type: :model do
  it { have_and_belong_to_many :projects }
end
