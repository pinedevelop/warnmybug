FactoryGirl.define do
  factory :environment do
    project
    name { Faker::Name.name }
  end

end
