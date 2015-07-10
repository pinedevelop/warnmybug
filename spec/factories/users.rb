FactoryGirl.define do
  
  factory :user do
    email {Faker::Internet.email}
    password "passwd123456"
    password_confirmation "passwd123456"
  end
  
end