# README

This Rails app was built with Ruby 2.6 and Rails 5.2. Here are steps that are necessary to get the application up and running.

Things you might need to do:

* Check Ruby version, make sure it is updated to the latest version.
:> ruby -v

* Check Rails version, make sure it is updated to the latest version.
:> rails -v

* System dependencies: Add gems needed to Gemfile
:> bundle install

* Configuration:
set up postgresql as the default database used for development and production in config/database.yml

* Database creation
:> rake db:migrate

* Deployment instructions
