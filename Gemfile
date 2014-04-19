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
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  # Postgres for heroku
  gem 'pg'
  # Newrelic to keep app alive on heroku and for performance
  gem 'newrelic_rpm'
end

gem 'sass', "~> 3.2.5"
gem 'sass-rails'

gem 'redcarpet'
gem 'jquery-rails'
gem "haml-rails"
gem "html2haml", :group => :development
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'aws-sdk'
gem 'aws-s3'
gem 'thin'
gem 'github_api'

gem "bootstrap-sass"
gem "omniauth"
gem "omniauth-github", :git => 'git://github.com/ryan-endacott/omniauth-github.git'
gem "simple_form"
gem "quiet_assets", :group => :development
gem "figaro"
gem "better_errors", :group => :development
gem "binding_of_caller", :group => :development, :platforms => [:mri_19, :rbx]
