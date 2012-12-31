require "bundler/setup"
Bundler.require :deploy


set :application, "onepennymedia"
set :rails_env, "production"

server "media.onepennyentrepreneur.com", :web, :app, :memcached, :main, :cron
set :user, "shaoshing"
set :deploy_to, "/home/shaoshing/app"
set :branch, "production"

set :scm, :git
set :repository,  "git@github.com:yuchenzhang/onepennymedia.git"
set :deploy_via, :remote_cache
set :keep_releases, 10
set :deploy_time, DateTime.now
set :use_sudo, false


after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'

require 'capistrano-unicorn'
