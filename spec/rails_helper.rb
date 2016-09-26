ENV["RAILS_ENV"] = "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "shoulda/matchers"
require "webmock/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/support/fixtures"
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true

  config.include ActionDispatch::TestProcess
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.include Helpers
  config.include JsonSpec::Helpers
  config.include Rails.application.routes.url_helpers
  config.include RailsApiFormat::Matchers
  config.include RSpec::Rails::RequestExampleGroup, type: :request, file_path: %r{spec\/controllers}

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before do
    ActionMailer::Base.deliveries.clear
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
    with.library :action_controller
  end
end
