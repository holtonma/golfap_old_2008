require 'erb'
require 'config/accelerator/accelerator_tasks'
  
set :application, "golfap"
set :repository,  "git@github.com:holtonma/golfap.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

# role :app, "golfapp.com" #"gmneydaa.joyent.us"
# role :web, "golfapp.com" #"gmneydaa.joyent.us"
# role :db,  "golfapp.com", :primary => true #"gmneydaa.joyent.us"


  default_run_options[:pty] = true
  set :domain, '8.12.36.73' #Your Accelerators public IP address
  set :deploy_to, "/var/www/apps/#{application}" 
  set :user, 'gmneydaa'
  set :scm, :git
  set :scm_username, "holtonma" 
  set :scm_passphrase, "golfap" 

  role :app, domain
  role :web, domain
  role :db,  domain, :primary => true

  set :server_name, "8.12.36.73" 
  set :server_alias, "*.8.12.36.73" 

  # Example dependancies
  depend :remote, :command, :gem
  depend :remote, :gem, :mongrel, '>=1.0.1'
  depend :remote, :gem, :rake, '>=0.7'


  ################################
  # Some tasks for the old server
  ################################

  task :after_deploy do
    # tasks to run after deploy
  end

  ################################
  # End tasks for the old server
  ################################

  deploy.task :restart do
    accelerator.smf_restart
    accelerator.restart_apache
  end

  deploy.task :start do
    accelerator.smf_start
    accelerator.restart_apache
  end

  deploy.task :stop do
    accelerator.smf_stop
    accelerator.restart_apache
  end

  after :deploy, 'deploy:cleanup'
