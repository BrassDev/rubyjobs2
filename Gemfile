source 'https://rubygems.org'

ruby '2.5.1'
gem 'rails', '5.2.3'
gem 'scoped_search' #, '~> 4.1.7'
gem 'RedCloth'      #, '~> 4.3.2'
gem 'dynamic_form'  #, '~> 1.1.4'
gem 'jquery-rails'  #, '~> 4.3.5'
gem 'thin'          #, '~> 1.7.2'
gem 'sass-rails'    #,   '~> 5.0.7'
gem 'coffee-rails'  #, '~> 5.0.0'
gem 'uglifier'      #, '>= 4.1.20'
gem 'byebug'

group :production do
  gem 'pg', '~> 1.1.4'
end

group :test do
  gem 'shoulda'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.13'
  # gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master' # requires ruby >= 2.3, higher than current version 2.1.0
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'coveralls', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'better_errors'
end
