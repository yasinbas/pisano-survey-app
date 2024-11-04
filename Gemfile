source "https://rubygems.org"

ruby "3.3.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"

# Use PostgreSQL as the database for Active Record
gem 'pg'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
gem 'psych', '5.1.2'

# Core gems
gem 'annotate'
gem 'rspec-rails', '~> 5.0.0'
gem 'simplecov', require: false
gem 'uuidtools'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Gems for API building
# gem "jbuilder"  # Uncomment if needed
# gem "redis", ">= 4.0.1"  # Uncomment if needed
# gem "bcrypt", "~> 3.1.7"  # Uncomment if needed

# Grouping gems
group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails"
  gem "faker"
  gem 'dotenv-rails'  # Sadece bir kere tanımlandı
end

group :development do
  gem "bullet"  # N+1 sorgu optimizasyonu için
  gem "rack-mini-profiler"  # Performans analizi için
  gem "better_errors"  # Hata sayfaları için
  gem "binding_of_caller"  # REPL için
end

# Authentication gems
gem "devise"
gem 'cancancan' # Yetkilendirme için
gem 'ostruct'  # Ruby 3.5 uyarısını gidermek için
gem 'logger'   # Ruby 3.5 uyarısını gidermek için

# Frontend gems
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'

# Windows-specific gems
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

# Asset management
gem "sprockets-rails"

# Additional gems
gem "pundit"  # Yetkilendirme için
gem "active_model_serializers"  # API serialization için
gem "rack-cors"  # CORS desteği için
gem "kaminari"  # Sayfalama için
gem "ransack"  # Arama ve filtreleme için
gem "sidekiq"  # Background jobs için
gem "paper_trail"  # Audit logging için
gem "rolify"  # Detaylı rol yönetimi için
gem "friendly_id"  # SEO-friendly URLs için
gem "draper"  # Decorator pattern için
gem "pagy"  # Hafif sayfalama için

# RSwag for API documentation
gem 'rswag'

# JWT for authentication
gem 'jwt'

# OmniAuth for third-party authentication
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
# ... diğer gemler ...
gem 'rack-attack'

gem 'secure_headers'
