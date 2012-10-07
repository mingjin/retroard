set :application, "Retroad"
set :repository,  "git://github.com/mingjin/retroard.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_via, :remote_cache

set :location, 'ec2-54-243-231-97.compute-1.amazonaws.com'
role :web, location                          # Your HTTP server, Apache/etc
role :app, location                          # This may be the same as your `Web` server
role :db, location, :primary=>true
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "ubuntu"
set :use_sudo, true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")] 

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end