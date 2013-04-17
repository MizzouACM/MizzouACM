source 'https://rubygems.org'
gem 'rails', '3.2.13'

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails", ">= 2.12.2"
  gem "factory_girl_rails", ">= 4.2.0"
end

group :test do
  gem "database_cleaner", ">= 1.0.0.RC1"
  gem "email_spec", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.3.1", :require => false
  gem "launchy", ">= 2.2.0"
  gem "capybara", ">= 2.0.2"
  gem "shoulda-matchers", "1.4.2"
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  # Postgres for heroku
  gem 'pg'
  # Newrelic to keep app alive on heroku and for performance
  gem 'newrelic_rpm'
end

gem 'jquery-rails'
gem "haml-rails", ">= 0.4"
gem "html2haml", ">= 1.0.1", :group => :development

gem "bootstrap-sass", ">= 2.3.0.0"
gem "omniauth", ">= 1.1.3"
gem "omniauth-github", :git => 'git://github.com/ryan-endacott/omniauth-github.git'
gem "simple_form", ">= 2.1.0"
gem "quiet_assets", ">= 1.0.2", :group => :development
gem "figaro", ">= 0.6.3"
gem "better_errors", ">= 0.7.2", :group => :development
gem "binding_of_caller", ">= 0.7.1", :group => :development, :platforms => [:mri_19, :rbx]
