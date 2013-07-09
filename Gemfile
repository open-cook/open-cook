source 'http://rubygems.org'
# source 'http://gems.github.com'
# Delete all gems: gem list | cut -d" " -f1 | xargs gem uninstall -aIx

gem "rails", "~> 4.0.0"

gem 'mysql2'
gem 'sqlite3'

# gem 'rails-i18n'
# Tags need refactor for Rails MassAttrProtect

gem 'sorcery'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 1.0.1'


gem 'compass'
gem 'kaminari'

gem 'russian'
gem 'sanitize'
gem "state_machine", "~> 1.2.0"
gem 'haml' 
gem 'acts-as-taggable-on'
gem 'awesome_nested_set'

# gem 'rmagick'
gem 'mini_magick'
gem 'paperclip'

gem 'daemons'
gem 'delayed_job', path: '../delayed_job'
gem 'delayed_job_active_record' , path: '../delayed_job_active_record'

gem 'the_role'    , path: '../the_role'
gem 'the_audit'   , path: '../the_audit'
gem 'the_storages', path: '../the_storages'
gem 'the_comments', path: '../the_comments'
gem 'the_sortable_tree', path: '../the_sortable_tree'

group :development do
  gem 'thin'
  # gem 'unicorn'
  # gem 'ruby-graphviz' # state machine visualization
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do  
  gem 'sprockets-rails'#, github: 'rails/sprockets-rails'
  gem 'coffee-rails'#,    github: 'rails/coffee-rails'
  gem 'sass-rails'#,      github: 'rails/sass-rails'
  gem 'uglifier', '>= 1.0.3'

  gem 'bootstrap-sass', '~> 2.2.2.0'
end

group :development, :test do
  gem 'faker'
  # gem "rspec-rails"
  # gem "rspec"
  # gem "rspec-core"
  # gem "rspec-expectations"
  # gem "rspec-mocks"      
end

group :test do
  gem 'capybara'
  gem 'factory_girl'
  gem 'database_cleaner'

  # autotest
  # gem 'guard'
  # gem 'guard-rspec'
  # gem 'guard-spork'

  # elegant BDD
  # gem 'cucumber-rails', :require => false

  # Test helpers
  # gem 'email_spec'  # emails specs
  # gem 'timecop'     # Time delays test
  # gem 'launchy'     # show broken cucumber tests

  # Pretty printed test output
  # gem 'turn' , '~> 0.8.3', :require => false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'