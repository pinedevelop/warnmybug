FactoryGirl.define do
  factory :notification do
    project
    notification_type { NotificationType::LOG }
    message { Faker::Lorem.sentence }
    url { Faker::Internet.url }
  end
end
