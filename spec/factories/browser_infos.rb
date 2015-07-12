FactoryGirl.define do
  factory :browser_info do
    notification
    app_code_name 'MyString'
    app_name 'MyString'
    app_version 'MyString'
    cookie_enabled false
    hardware_concurrency 'MyString'
    language 'MyString'
    mime_types 'MyText'
    online false
    platform 'MyString'
    plugins 'MyText'
    product 'MyString'
    product_sub 'MyString'
    user_agent 'MyString'
    vendor 'MyString'
    vendor_sub 'MyString'
  end
end
