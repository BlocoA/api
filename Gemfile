# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3'

gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'
gem 'jwt', '~> 2.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'pry-rails', '~> 0.3.3'
  gem 'rubocop', '~> 1.29', '>= 1.29.1'
  gem 'rubocop-performance', '~> 1.13', '>= 1.13.3'
  gem 'rubocop-rails', '~> 2.14', '>= 2.14.2'
  gem 'rubocop-rspec', '~> 2.10'
end

group :development do
  gem 'annotate', '~> 3.2'
end

group :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.21'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'shoulda-matchers', '~> 5.1'
end
