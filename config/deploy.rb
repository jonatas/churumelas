require "rvm/capistrano"
require 'bundler/capistrano'
set :bundle_flags, "--deployment --verbose"

GITHUB_REPOSITORY_NAME = 'churumelas'
LINODE_SERVER_HOSTNAME = '66.228.54.36'

#############################################
#############################################

# General Options

set :rvm_bin_path,               "/root/.rvm/bin"
set :bundle_flags,               "--deployment"
set :application,                "churumelas"
set :hostname,                   "churumelas.ideia.me"
set :deploy_to,                  "/var/www/apps/churumelas"
set :normalize_asset_timestamps, false
set :rails_env,                  "production"

set :user,                       "root"

set :scm,        :git
set :repository, "git@github.com:jonatas/#{GITHUB_REPOSITORY_NAME}.git"
set :branch,     "master"

role :app, LINODE_SERVER_HOSTNAME
role :db,  LINODE_SERVER_HOSTNAME, :primary => true

namespace :deploy do
  desc "Restarting jetty_rails"
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop 
    start
  end
  desc "Stopping jetty_rails"
  task :stop, :roles => :app, :except => { :no_release => true } do
  end
  desc "Starting rails app with jetty_rails"
  task :start, :roles => :app do
    run "cd #{current_path} && #{try_runner} script/rails server -p 80 -d -e production ", :pty => true
  end
end


