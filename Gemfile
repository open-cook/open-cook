source 'https://rubygems.org'
# source 'http://gems.github.com'
# Delete all gems: gem list | cut -d' ' -f1 | xargs gem uninstall -aIx
# for i in `gem list --no-versions`; do gem uninstall -aIx $i; done

gem 'rails', '~> 4.1.0.beta1'
gem 'unicorn'

# Datebase
gem 'mysql2'

# App level
gem 'sorcery'
gem 'RedCloth', require: 'redcloth'

# views
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 1.0.1'

gem 'haml'
gem 'kaminari'
gem "compass-rails", "~> 1.1.3"

gem 'sass-rails'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'

# Models
gem 'sanitize'
gem 'state_machine', '~> 1.2.0'

gem 'acts-as-taggable-on', 
  github: "mbleigh/acts-as-taggable-on",
  branch: "master"

gem 'awesome_nested_set',
  github: "collectiveidea/awesome_nested_set",
  branch: "master"

# Images and files
gem 'mini_magick'
gem 'paperclip'

# DJ
gem 'daemons'

gem 'delayed_job',
  git: 'https://github.com/collectiveidea/delayed_job.git',
  tag: 'v4.0.0.beta2'

gem 'delayed_job_active_record',
  git: 'https://github.com/collectiveidea/delayed_job_active_record.git',
  tag: 'v4.0.0.beta3'

# Open Cook components
gem 'the_sortable_tree'

gem 'the_string_to_slug',
  #, path: '../the_string_to_slug' #, '~> 0.0.6'
  github: 'the-teacher/the_string_to_slug',
  branch: 'master'

gem 'the_role',
  # path: '../the_role'
  github: 'the-teacher/the_role',
  branch: 'master'

gem 'the_storages',
  # path: '../the_storages'
  github: 'the-teacher/the_storages',
  branch: 'master'

gem "the_comments",
  # path: '../the_comments',
  github: 'the-teacher/the_comments',
  branch: 'kiss_version'

gem "the_notification",
  # path: '../the_notification'
  github: 'the-teacher/the_notification',
  branch: 'master'

gem 'the_audit',
  path: '../the_audit'
  # github: 'open-cook/the_audit',
  # branch: 'master'

group :development, :test do
  gem 'colored'
  gem 'thin'
  gem 'faker'
  gem 'seedbank', github: 'james2m/seedbank'

  gem 'rspec'
  gem 'rspec-core'
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'rspec-expectations'
end

group :development do
  gem 'quiet_assets'
  gem 'sqlite3'
end

group :assets do  
  gem 'uglifier', '>= 1.0.3'
  gem 'sprockets-rails'
  gem 'coffee-rails'
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

  # Pretty printed test output
  # gem 'turn' , '~> 0.8.3', :require => false
end