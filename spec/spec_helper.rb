require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
# This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'

  require 'rails/application'
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'shoulda/matchers/integrations/rspec'
  require 'rspec/autorun'
  require 'chronic'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|

    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
    config.use_transactional_fixtures = false

    config.include FactoryGirl::Syntax::Methods
    config.include EmailSpec::Helpers
    config.include EmailSpec::Matchers
    config.include Devise::TestHelpers, :type => :controller

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.infer_base_class_for_anonymous_controllers = false

    config.order = "random"

    config.before(:suite) do
      # Truncate and seed the database
      DatabaseCleaner.clean_with :truncation
      DatabaseCleaner.clean

      # No longer need the slower truncation clean strategy, and don't clean our seed data
      DatabaseCleaner.clean_with :deletion
      DatabaseCleaner.strategy = :transaction
    end

    config.before do
      ActionController::Base.cache_store.clear
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
    end

  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
end
