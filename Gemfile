source 'https://rubygems.org'
#ruby "1.9.3"
gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem "heroku"  ##
group :development, :test do
	gem 'sqlite3'
end

gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"


group :production do
  gem "pg"
end

# Gems used only for assets and not required
# in production environments by default.
#group :assets do
  
#  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

#  gem 'uglifier', '>= 1.0.3'
#end

group :assets do
gem 'sass-rails'
gem 'coffee-rails'
gem 'coffee-script-source', '~> 1.4.0' # ADD THIS LINE, 1.5.0 doesn't compile ActiveAdmin JavaScript files
gem 'uglifier'
end


#gem 'sass-rails',   '~> 3.2.3'
gem 'jquery-rails'

# framework for creating administration style interfaces
gem 'activeadmin'
gem "meta_search", '>= 1.1.0.pre'
gem 'cancan'
gem 'ui_datepicker-rails3'
gem 'validates_timeliness', '~> 3.0'

# necessary for running on fedora, why?
#require 'v8'
#gem "therubyracer", :require => 'v8'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
