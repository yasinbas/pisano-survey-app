source "https://rubygems.org"

ruby "3.3.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"

# Use sqlite3 as the database for Active Record
gem 'pg'


# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
gem 'psych', '5.1.2'

gem 'annotate'
gem 'rspec-rails', '~> 5.0.0'
gem 'simplecov', require: false

gem 'uuidtools'


# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem 'devise'
gem 'cancancan' # Yetkilendirme için
gem 'ostruct'  # Ruby 3.5 uyarısını gidermek için
gem 'logger'   # Ruby 3.5 uyarısını gidermek için

gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'

gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'reline'

