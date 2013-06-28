source 'http://rubygems.org'
ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.4'

gem 'puma'
gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'activerecord-jdbcpostgresql-adapter'
gem 'jruby_sandbox'
gem 'jruby-openssl'
gem 'jetty-rails'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'mizuno'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'


# To use debugger
# gem 'debugger'
group :production do
  gem 'therubyrhino'
end
group :test do
  gem "guard-jruby-rspec"
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'autotest-standalone'
  gem 'autotest-fsevent'
  gem 'autotest-growl'
end
