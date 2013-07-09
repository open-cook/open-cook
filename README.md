### HOW TO INSTALL 

Create project dir

```
mkdir rails4
cd rails4
```

Clone project

```
git clone git@github.com:open-cook/open-cook.git
```

Clone gems repos

```
git clone git@github.com:open-cook/the_audit.git
git clone git@github.com:the-teacher/the_role.git
git clone git@github.com:the-teacher/the_comments.git
git clone git@github.com:the-teacher/the_storages.git
git clone git@github.com:the-teacher/the_sortable_tree.git
git clone https://github.com/collectiveidea/delayed_job_active_record.git
git clome https://github.com/collectiveidea/delayed_job.git
```

rails 4 required
```
gem update rails
```

Change directory

```
cd open-cook
```

Create DB config file

```
touch config/database.yml
```

Open config file and puts following config text:

**config/database.yml**

```
development:
  adapter: sqlite3
  database: db/development.db

test:
  adapter: sqlite3
  database: db/test.db
```

Bundle!

```
bundle
```

Create DB and test data

```
rake db:bootstrap_and_seed
```

DJ run

```
script/delayed_job start
```

web server run

```
bin/rails s -p 3010 -b host.name
```

### Others

Draw

```
bin/rake state_machine:draw CLASS=Comment
```

TESTS

```
bundle exec rspec spec/integration/welcome_spec.rb --format documentation
```

# included do; end
# module ClassMethods; end
# module InstanceMethods; end