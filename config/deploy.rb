require 'capistrano/ext/multistage'
require 'bundler/capistrano'
set :stages, %w(production staging)
set :default_stage, "production"

# Application name
set :application, "adways_server"

# Repository
set :repository,  "git@github.com:framgia/adways_server.git"
set :scm, :git

# RVM
require 'rvm/capistrano'
set :rvm_ruby_string, '2.1.0'
set :rvm_type, :system

# Deploy user
set :user, 'deploy'
set :use_sudo, false
set :default_run_options, :pty => true

# Set tag, branch or revision
set :current_rev, `git show --format='%H' -s`.chomp
set :branch do
  default_tag = current_rev
  tag = ENV["DEPLOY_TARGET"] || Capistrano::CLI.ui.ask("Tag to deploy : [#{default_tag}]")
  tag = default_tag if tag.empty?
  tag
end

# for Unicorn
namespace :deploy do
  task :start do
  end
  task :stop do
  end
  task :restart, :roles => :web, :except => { :no_release => true } do
    run "kill -USR2 `cat #{pid_file}`"
  end
  task :reload, :roles => :web, :except => { :no_release => true } do
    run "kill -HUP `cat #{pid_file}`"
  end
  task :delete_old do
    set :keep_releases, 2
  end
end

desc "after finish deploy"
task :symlink, :roles => :app do
  run "ln -s #{current_path}/config/database.ymls/#{rails_env}.yml #{current_path}/config/database.yml"
  run "ln -s #{current_path}/../../shared/uploads #{current_path}/public/uploads"
end

after 'deploy:update', 'symlink', 'deploy:cleanup', 'assets:precompile'

# precompile assets
namespace :assets do
  task :precompile, :roles => :app do
    # run "ln -s /usr/local/rails_app/adways_server/shared/assets #{release_path}/public/assets"
    run "cd #{current_path}; RAILS_ENV=#{rails_env} rake assets:precompile"
  end
end
