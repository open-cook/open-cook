#### Install from scratch

check your soft:

```
gem -v
node -v
rails -v
searchd --help
mysql   --version
convert --version
mogrify --version
sqlite3 --version
```

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
```

Change directory

```
cd open-cook
```

RVM config

```
cp .rvmrc.example .rvmrc
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

Create DB and Migrate

```
rake db:bootstrap
```

Create Basic Data for launch

```
rake db:first:launch
```

Run web server

```
rails s
```

Browser

```
http://localhost:3000/
```