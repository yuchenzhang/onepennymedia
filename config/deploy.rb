require "bundler/setup"
Bundler.require :deploy


set :application, "onepennymedia"
set :rails_env, "production"

server "media.onepennyentrepreneur.com", :web, :app, :db, :primary => true
set :user, "shaoshing"
set :deploy_to, "/home/shaoshing/app"
set :branch, "master" # should change to production

set :scm, :none # :git
set :repository, "." # "git@github.com:yuchenzhang/onepennymedia.git"
set :deploy_via, :copy # remote_cache
set :keep_releases, 10
set :deploy_time, DateTime.now
set :use_sudo, false
set :default_environment, { 'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" } # load rbenv for capistrano
set :bundle_flags, "--deployment --without development test deploy --quiet --binstubs --shebang ruby-local-exec"

namespace :onepennymedia do
  task :setup, :roles => :app do
    run "mkdir -p #{shared_path}/sqlite3"
  end

  task :create_symlink, :roles => :app do
    run "ln -sf #{shared_path}/sqlite3 #{latest_release}/db/sqlite3"
  end
end

require "bundler/capistrano"
require 'capistrano-unicorn'
after 'deploy:restart', 'unicorn:reload'
after 'deploy:restart', 'unicorn:stop'
after 'deploy:restart', 'unicorn:start'
after 'deploy:setup', 'onepennymedia:setup'
before 'deploy:create_symlink', 'onepennymedia:create_symlink'
