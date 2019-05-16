# Book-Lessons Rails App

This Rails app was built with Ruby 2.6 and Rails 5.2. Here are steps that are necessary to get the application up and running.

Things you might need to do:

* Check Ruby version: the Ruby you’re using should be version 2.2.0 or above
```ruby
    :> ruby -v
```
* Check Rails version: Rails should be version 5 or above
```ruby
    :> rails -v
```
* System dependencies: Add all of gems needed to Gemfile
```ruby
    :> bundle install
```

* Configuration:
Use PostgreSQL as the default database used for development and production in config/database.yml
```ruby
  gem 'pg'
```
* Database creation
```ruby
    :> rake db:migrate
```

* Deployment instruction:
```ruby
    :> heroku login
    :> heroku create
    :> heroku apps:rename my-app-name
    :> git add .
    :> git commit -m "Push Rails app to heroku"
    :> git push heroku master
    :> heroku run rake db:migrate
```
