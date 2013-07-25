# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'


require File.expand_path("../../config/routes",__FILE__)
#require 'webmock/rspec'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.use_transactional_fixtures = false


	DatabaseCleaner.strategy = :truncation

	# then, whenever you need to clean the DB
	DatabaseCleaner.clean

	config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  #config.include Capybara.default_driver = :selenium
end





