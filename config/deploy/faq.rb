server "faq.onepennyentrepreneur.com", :web, :app, :db, :primary => true

set :application, "onepenny-faq"
set :rails_env, "production"
set :branch, "production"

set :user, "shaoshing"
set :deploy_to, "/home/shaoshing/app"
