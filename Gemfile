source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.0"
gem 'rails', '~> 5.0.2'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# # Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster.
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'shoulda-matchers'

  gem 'api_matchers'
  gem 'rails-controller-testing'

  gem 'rspec-given'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#versioning Rails based Restful Api
gem 'versionist'

#user authentication
gem 'devise'

#for secure rails application secret configuration
gem "figaro"

#delayed job
gem 'delayed_job_active_record'
gem "daemons"

#bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# gem 'sass-rails', '>= 3.2'
gem "font-awesome-rails"
gem 'jquery-ui-rails'

#datepicker & timepicker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'

#uploading image
gem 'carrierwave', '~> 1.0'
gem "fog"

#resizing and images
gem "mini_magick"

#rails
gem 'trix'

#rails datepicker
gem 'bootstrap-datepicker-rails'

#rails search engine gem
gem 'ransack'

#graph for rails
gem "chartkick"
