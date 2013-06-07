require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'cucumber/rails'
  require 'email_spec'
  require 'email_spec/cucumber'
  require 'capybara/rails'

  ActionController::Base.allow_rescue = false

  Capybara.default_selector = :css
  Capybara.javascript_driver = :webkit

  World(FactoryGirl::Syntax::Methods)

  # Remove/comment out the lines below if your app doesn't have a database.
  # For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
  begin
    DatabaseCleaner.strategy = :deletion
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Before("@debug") do
    Capybara.current_driver = :selenium
  end

  Before do
    DatabaseCleaner.start
  end

  After do
    DatabaseCleaner.clean
    Timecop.return
  end

  Cucumber::Rails::World.use_transactional_fixtures = false

  # You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
  # Possible values are :truncation and :transaction
  # The :transaction strategy is faster, but might give you threading problems.
  # See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
  Cucumber::Rails::Database.javascript_strategy = :deletion
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
end
