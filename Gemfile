# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'simple_form'
gem 'slim-rails'

gem 'state_machines'
gem 'state_machines-activerecord'

gem 'kaminari'
gem 'ransack'
gem 'responders'
gem 'active_model_serializers'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rubocop'
  gem 'rubocop-rails', '~> 2.16', '>= 2.16.1'
  gem 'faker', '~> 1.6', '>= 1.6.6'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
