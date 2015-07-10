# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'simplecov'
ActiveRecord::Migration.maintain_test_schema!

SimpleCov.start

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  
  config.include Devise::TestHelpers, type: :controller

  config.include FactoryGirl::Syntax::Methods
  
  config.infer_spec_type_from_file_location!
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
