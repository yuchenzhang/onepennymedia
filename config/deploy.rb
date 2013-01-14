require "bundler/setup"
Bundler.require :deploy
require 'capistrano/ext/multistage'


set :stages, %w(media faq)

set :scm, :git

set :repository, "git@github.com:yuchenzhang/onepennymedia.git"
set :ssh_options, {:forward_agent => true}

set :deploy_via, :remote_cache
set :keep_releases, 10
set :deploy_time, DateTime.now
set :use_sudo, false
set :default_environment, { 'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" } # load rbenv for capistrano
set :bundle_flags, "--deployment --without development test deploy --quiet --binstubs --shebang ruby-local-exec"
set :whenever_command, "bundle exec whenever"

namespace :deploy do
  desc "tail production log files"
  task :tail_logs, :roles => :app do
    trap("INT") { puts 'Interupted'; exit 0; }
    run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:host]}: #{data}"
      break if stream == :err
    end
  end
end

namespace :onepennymedia do
  task :setup, :roles => :app do
    run "mkdir -p #{shared_path}/sqlite3"
  end

  task :create_symlink, :roles => :app do
    run "ln -sf #{shared_path}/sqlite3 #{latest_release}/db/sqlite3"
    run "ln -sf #{shared_path}/system/uploaded_files #{latest_release}/public/files"
  end
end

require "bundler/capistrano"
require 'capistrano-unicorn'
require "whenever/capistrano"

after 'deploy:restart', 'unicorn:reload'
after 'deploy:restart', 'unicorn:restart'
after 'deploy:setup', 'onepennymedia:setup'
before 'deploy:create_symlink', 'onepennymedia:create_symlink'
