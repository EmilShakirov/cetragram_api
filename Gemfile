source "https://rubygems.org"

ruby "2.3.1"

gem "rails", "~> 4.2.7.1"
gem "pg"
gem "rails-api"
gem "rails_api_format", path: "lib/rails_api_format"

# all other gems
gem "active_model_serializers", git: "https://github.com/rails-api/active_model_serializers.git"
gem "decent_exposure", "3.0.0"
gem "devise"
gem "dotenv-rails"
gem "draper"
gem "interactor"
gem "kaminari"
gem "rack-cors", require: "rack/cors"
gem "responders"
gem "seedbank"
gem "shrine-uploadcare"
gem "shrine"
gem "simple_token_authentication"
gem "puma"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "foreman"
  gem "spring-commands-rspec"
  gem "spring"
end

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop"
end

group :test do
  gem "database_cleaner"
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
