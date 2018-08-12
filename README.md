# IdeaGrid

Community app where can people can validate and discuss ideas with the world

### Technologies Used
- Ruby 2.5.1
- Rails 5.2
- nginx
- Phusion Passenger
- PostgreSQL
- Sass
- Redis/Sidekiq
- Bootstrap
- Webpack/Webpacker
- Vanilla™ ES6


### nginx/webserver setup
On Mac OSX run

`brew install nginx --with-passenger`

See more
[on configuring Passenger on OSX](https://www.phusionpassenger.com/library/install/nginx/install/oss/osx/)

Add a server config, or to the main `nginx.conf` file:

```
server {
  listen 80;
  server_name ideagrid.local;
  root /Users/you/path/to/ideagrid/public;
  access_log /Users/you/path/to/ideagrid/log/nginx_access.log;
  error_log /Users/you/path/to/ideagrid/log/nginx_error.log;
  passenger_enabled on;
  rack_env development;
}

```
Add a line to your `/etc/hosts` file like:

`127.0.0.1 ideagrid.local`


### Postgres Setup

IdeaGrid is developed against Postgres 9.6. I recommend using [Postgres.app](https://postgresapp.com/)


### Rails Setup

1. `git clone git@github.com:ckahle33/ideagrid.git`
2. `cd ideagrid`
3. `bundle install`
4. `cp ./config/database.yml.example ./config/database.yml` (this will end up in .env)
6. `cp .env.example .env`
7. `bundle exec rake db:create db:migrate db:seed`
8. `touch tmp/restart.txt` (to restart passenger)


### Frontend
`yarn install`

`./bin/webpack-dev-server`
