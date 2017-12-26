source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

gem 'devise'
gem 'devise-i18n'
gem 'i18n'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'materialize-sass'
gem 'material_icons'
gem 'carrierwave'
gem 'carrierwave-i18n'
gem 'mini_magick'
gem 'rails-i18n'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rails-controller-testing'  
  gem 'dotenv-rails'
end

group :test do
  gem 'simplecov', :require => false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'brakeman', :require => false
  gem 'better_errors'
  gem 'binding_of_caller'
end
