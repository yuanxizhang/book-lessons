# README

This Rails app was built with Ruby 2.6 and Rails 5.2. Here are steps that are necessary to get the application up and running.

Things you might need to do:

* Check Ruby version: the Ruby you’re using should be version 2.2.0 or above
:> ruby -v

* Check Rails version: Rails should be version 5 or above
:> rails -v

* System dependencies: Add all of gems needed to Gemfile
:> bundle install

* Configuration:
Add gem 'pg' in your Gemfile
Use postgresql as the default database used for development and production in config/database.yml

* Database creation
:> rake db:migrate

* Deployment instructions
signed up with Heroku
:> heroku login
:> heroku create
:> heroku apps:rename new-app-name
:> git add .
:> git commit -m "Push app to heroku"
:> git push heroku master
:> heroku run rake db:migrate
