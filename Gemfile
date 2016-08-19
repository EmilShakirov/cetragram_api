source "https://rubygems.org"

ruby "2.3.1"

# the most important stuff
gem "rails"
gem "pg"
gem "rails-api"
gem "rails_api_format", path: "lib/rails_api_format"

# all other gems
gem "active_model_serializers", git: "https://github.com/rails-api/active_model_serializers.git"
gem "concord"
gem "decent_exposure"
gem "devise"
gem "dotenv-rails"
gem "imgurapi", github: "tam-vo/imgur"
gem "interactor"
gem "kaminari"
gem "procto"
gem "rack-cors", require: "rack/cors"
gem "responders"
gem "seedbank"
gem "simple_token_authentication"
gem "thin"

group :development do
  gem "bullet"
  gem "foreman"
  gem "letter_opener"
  gem "spring-commands-rspec"
  gem "spring"
end

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "byebug"
  gem "mail_safe"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop"
end

group :test do
  gem "database_cleaner"
  gem "email_spec"
  gem "json_spec"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "webmock", require: false
end

group :development, :test, :staging do
  gem "apitome"
  gem "factory_girl_rails"
  gem "faker"
  gem "rspec_api_documentation"
end

group :staging, :production do
  gem "rails_12factor"
  gem "rollbar"
end
