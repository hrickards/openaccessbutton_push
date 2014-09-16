require 'rubygems'
require 'bundler'

Bundler.require

require './app.rb'

require 'rack/wwwhisper'
use Rack::WWWhisper

run Sinatra::Application
