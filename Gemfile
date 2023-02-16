source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby File.read("#{__dir__}/.ruby-version").strip

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis"
gem "redis-namespace"
gem "redis-rack-cache"
gem "redis-rails"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "devise"

gem 'bootstrap', '~> 5.2', '>= 5.2.3'
gem "font-awesome-sass", "~> 6.3.0"
gem 'jquery-rails', '~> 4.4'

gem 'kaminari'

gem 'resque'
gem 'resque-scheduler'

gem "airbrake"
gem "airbrake-ruby"
gem 'retryable'

gem 'foreman'

gem 'webpacker'

gem 'jwt'

gem 'active_model_serializers'

gem 'progress_bar'
gem 'sunspot_rails'
gem 'sunspot_solr'

gem 'base62'

gem 'slack-notifier'

gem 'pundit'

gem 'mini_magick'
gem 'carrierwave'
gem 'carrierwave-imageoptimizer'

# TODO
# gem 'grape'

# TODO
# gem "activerecord-import"

# TODO
# gem 'sitemap_generator'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]

  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
  gem 'shoulda-matchers'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'memory_profiler'
  gem 'rack-mini-profiler'
  gem 'stackprof'
  gem 'web-console'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'byebug'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'rack_session_access'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'webmock', require: false
end
