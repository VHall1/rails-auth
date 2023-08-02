source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "jwt"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "redis", "~> 4.0"
gem "sqlite3", "~> 1.4"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'simplecov', require: false
end

group :development do
  gem 'rubocop', '~> 1.55', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
