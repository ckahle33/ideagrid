# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :rails_env, "production"

set :application, "ideagrid"
set :repo_url, "git@github.com:ckahle33/ideagrid.git"
set :user, "ideagrid"

set :ssh_options, { forward_agent: true }

set :passenger_restart_with_touch, true

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ideagrid"

# Default value for :linked_files is []
set :linked_files, %w{.env config/database.yml config/secrets.yml}
set :rails_env, -> { fetch(:stage) }

# Default value for linked_dirs is []
# set :linked_dirs, %w{config}
append :linked_dirs, '.bundle'
