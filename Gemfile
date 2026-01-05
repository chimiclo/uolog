source "https://rubygems.org"

gem "rails", "~> 8.1.1"

gem "pg", "~> 1.6"
gem "puma", ">= 5.0"

gem "turbo-rails"
gem "stimulus-rails"

gem "sprockets-rails"

gem "image_processing", "~> 1.2"

gem "devise"

gem "aws-sdk-s3", require: false

gem "kaminari"

gem "jbuilder"

gem "bootsnap", require: false

gem "kamal", require: false
gem "thruster", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
