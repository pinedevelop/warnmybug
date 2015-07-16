FactoryGirl.define do
  
  factory :user_preference do
    user
    environment
    email {true}
  end

end
