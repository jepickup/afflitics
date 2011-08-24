# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

#Load fabricators
Dir[Rails.root.join("spec/fabricators/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Clean up the database
  require 'database_cleaner'
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end
  
  config.before(:all) do
    DatabaseCleaner.clean

    #Create fabrications
    @test_user      = Fabricate(:test_user)
    @test_network   = Fabricate(:affiliate_window)
    @test_subscription = Fabricate(:affiliate_window_sub, :user => @test_user, :network => @test_network)

    #Test attributes
    @valid_network = @test_network.name
    @valid_function = @test_network.services[0].functions[0].request_str
    @valid_user_config = { :username => 'afftest' }
  
  end

end
