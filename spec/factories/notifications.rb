FactoryGirl.define do
  factory :notification do
    environment
    notification_type { NotificationType::LOG }
    message { Faker::Lorem.sentence }
    url { Faker::Internet.url }
  end
end
