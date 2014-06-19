source 'http://rubygems.org'
source "http://gems.github.com"

gem 'rails', '3.0.3'
gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'
gem 'i18n', '0.4.2'
gem 'gherkin'
gem 'prawn', '0.8.4'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# So that devise can generate views
group :development do
  gem 'ruby_parser'
  gem 'hpricot'
end

# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

gem 'compass', '>= 0.10.6'
gem 'hassle', :git => 'git://github.com/koppen/hassle.git'
gem 'formtastic'
gem 'validation_reflection'
gem 'devise'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem "rspec-rails", ">= 2.2.0"
  gem 'builder', ">= 2.1.2"
end

group :test do
  gem 'pdf-reader'
  gem 'faker'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'timecop'
  gem 'chronic'
  gem "webrat"
  gem 'cucumber-rails', '0.3.2'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'spork'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rcov'
  gem 'rspec-rails-matchers'
  gem 'pdf-inspector', '>=0.7.99', :git => 'git://github.com/sandal/pdf-inspector.git'
end
