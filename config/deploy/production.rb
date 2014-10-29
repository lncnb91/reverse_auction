set :rails_env, 'production'
set :deploy_env, 'production'
# Directories
set :deploy_to, "/usr/local/rails_apps/adways_server"
set :pid_file, "/tmp/unicorn_adways_server.pid"

role :web, 'localhost'
role :app, 'localhost'
role :db, 'localhost', :primary => true