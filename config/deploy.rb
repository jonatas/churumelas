require "rvm/capistrano"
require 'bundler/capistrano'
set :rails_env,             'production'
set :rvm_type,              :system
set :rvm_ruby_string, "jruby-1.7.0.preview2"
set :rvm_path,          "/usr/local/rvm"
set :rvm_bin_path,      "#{rvm_path}/bin"
set :rvm_lib_path,      "#{rvm_path}/lib"

set :default_environment: {
        PATH:         "/usr/local/rvm/gems/jruby-1.7.0.preview2/bin:/usr/local/rvm/gems/jruby-1.7.0.preview2@global/bin:/usr/local/rvm/rubies/jruby-1.7.0.preview2/bin:/home/deploy/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
      GEM_HOME:     "/usr/local/rvm/gems/jruby-1.7.0.preview2"
          GEM_PATH:     "/usr/local/rvm/gems/jruby-1.7.0.preview2:/usr/local/rvm/gems/jruby-1.7.0.preview2@global"
              MY_RUBY_HOME: "/usr/local/rvm/rubies/jruby-1.7.0.preview2"
                  IRBRC:        "/usr/local/rvm/rubies/jruby-1.7.0.preview2/.irbrc"
                      RUBYOPT:      ""
                          gemset:       ""
}
set :bundle_dir,            "#{rvm_path}/gems/#{rvm_ruby_string}"
set :bundle_flags,      "--deployment --verbose"

GITHUB_REPOSITORY_NAME = 'churumelas'
LINODE_SERVER_HOSTNAME = '66.228.54.36'

#############################################
#############################################

# General Options

set :bundle_flags,               "--deployment"

set :application,                "churumelas"
set :hostname,                   "churumelas.ideia.me"
set :deploy_to,                  "/var/www/apps/churumelas"
set :normalize_asset_timestamps, false
set :rails_env,                  "production"

set :user,                       "deploy"
set :runner,                     "www-data"
set :admin_runner,               "www-data"

# Password-less Deploys (Optional)
#
# 1. Locate your local public SSH key file. (Usually ~/.ssh/id_rsa.pub)
# 2. Execute the following locally: (You'll need your Linode server's root password.)
#
#    cat ~/.ssh/id_rsa.lub | ssh root@LINODE_SERVER_HOSTNAME "cat >> ~/.ssh/authorized_keys"
#
# 3. Uncomment the below ssh_options[:keys] line in this file.
#
 ssh_options[:keys] = ["~/.ssh/id_rsa"]

# SCM Options
set :scm,        :git
set :repository, "git@github.com:jonatas/#{GITHUB_REPOSITORY_NAME}.git"
set :branch,     "master"

# Roles
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
    run "cd #{current_path} && script/stop_jetty", :pty => true
  end
  desc "Starting rails app with jetty_rails"
  task :start, :roles => :app do
    run "cd #{current_path} && #{try_runner} nohup script/spin", :pty => true
  end
end


