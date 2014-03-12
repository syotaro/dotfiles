# Redmine installation on MacOSX

## Install brew

- Follow the instructions on [https://github.com/mxcl/homebrew](https://github.com/mxcl/homebrew)
~~~
/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
~~~
- Install MySQL server
~~~
brew install mysql
~~~
- Install ImageMagick
~~~
brew install imagemagick --disable-openmp
~~~

## Install gems to global

- Some gems might be installed into the *global* gemset since they are needed in other projects too.

~~~
gem install bundler
gem install mysql2
gem install rails
gem install rake
gem install rmagick
~~~

## Install Redmine

- Follow the instructions on [http://www.redmine.org/projects/redmine/wiki/RedmineInstall](http://www.redmine.org/projects/redmine/wiki/RedmineInstall)

~~~
git clone git://github.com/redmine/redmine.git
cd redmine
~~~

## Configure the database connection

- Follow the instructions on the [Redmine page](http://www.redmine.org/projects/redmine/wiki/RedmineInstall) to create a

~~~
cp -a config/database.yml.example vim config/database.yml
  #=> enable sqlite3
vim config/database.yml
~~~

## install gems to repository

~~~
$bundle install --path vendor/bundle --without development test postgresql
~~~

## Migrate and seed the database

~~~
bundle exec rake generate_secret_token
bundle exec rake db:create RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake redmine:load_default_data RAILS_ENV=production
~~~

## Start Redmine
- `$ rails s -e production -p 3000`
- alternatively: `$ ruby script/rails server webrick -e production`


### Start the database service
- `$ mysql.server start`

### Create the database tables
- `$ mysql -u root -p`
- `mysql> create database redmine character set utf8;`
- `mysql> create user 'redmine'@'localhost' identified by 'my_password';`
- `mysql> grant all privileges on redmine.* to 'redmine'@'localhost';`

## SMTP

~~~
cp -a  config/configuration.yml.example config/configuration.yml
~~~



## Add Plugin

- [alrick/Reddrop](https://github.com/alrick/Reddrop)

