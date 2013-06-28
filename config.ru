# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Churumelas::Application

require 'rubygems'
require 'bundler'

$stdout.sync = true
Bundler.require(:rack)

application = File.expand_path('../my_app.ru', __FILE__)
