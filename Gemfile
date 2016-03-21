source 'https://rubygems.org'

gem 'rails', '4.2.6'

gem 'rails-api', '~> 0.4.0'
gem 'active_model_serializers', '~> 0.8.3' # NOTE: not the 0.9
gem 'devise', '~> 3.4.1'
gem 'cancan'
gem 'rack-cors', :require => 'rack/cors'

group :production do
  gem 'pg'
  gem 'puma'
  gem 'rails_stdout_logging'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
end
