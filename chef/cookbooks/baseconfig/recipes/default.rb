# This template is adapted From the template provided by SFU CMPT 470 by Gregery Baker(https://www2.cs.sfu.ca/~ggbaker/)


###################### Parameters ##############################
# Turn this to true if you already have your app in the directory
APP_EXIST = False
################################################################


###################### VM Setup ################################
# Make sure the Apt package lists are up to date, so we're downloading versions that exist.
cookbook_file "apt-sources.list" do
  path "/etc/apt/sources.list"
end
execute 'apt_update' do
  command 'apt-get update'
end
# Base configuration recipe in Chef.
package "wget"
package "ntp"
cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end
execute 'ntp_restart' do
  command 'service ntp restart'
end
###############################################################


################# node & express & npm ########################
# install & update node/npm
# Update nodejs
# https://stackoverflow.com/a/19584407
package "nodejs"
package "npm"
execute 'update nodejs' do
  user 'vagrant'
  environment ({'HOME' => '/home/vagrant'})
  cwd '/home/vagrant'
  command 'sudo npm install -g n; sudo n stable'
end
# install express generator
execute 'npm install express-generator' do
  user 'vagrant'
  environment ({'HOME' => '/home/vagrant'})
  cwd '/home/vagrant'
  command 'sudo npm install -g express-generator'
end
###############################################################

######################### Database ############################
# Install postgresql
package "postgresql"
# Grant user vagrant the privileges
execute 'grant_vagrant_privileges_to_database' do
  command 'echo "CREATE DATABASE app_development; CREATE DATABASE app_test; CREATE DATABASE app_production; CREATE USER vagrant WITH LOGIN PASSWORD \'vagrant\'; GRANT ALL PRIVILEGES ON DATABASE app_development TO vagrant; GRANT ALL PRIVILEGES ON DATABASE app_test TO vagrant; GRANT ALL PRIVILEGES ON DATABASE app_production TO vagrant;" | sudo -u postgres psql'
end
###############################################################

######################## Sequelize ############################
# install sequelize-cli
execute 'npm install sequelize-cli' do
  user 'vagrant'
  environment ({'HOME' => '/home/vagrant'})
  cwd '/home/vagrant'
  command 'sudo npm install -g sequelize-cli'
end
###############################################################

######################## Nginx ################################
# Install nginx
package "nginx"
# Copy nginx default config to the vm
cookbook_file "nginx-default" do
  path "/etc/nginx/sites-available/default"
end
###############################################################

################## Deployment Related #########################
if APP_EXIST
  # install dependencies
  execute 'npm install' do
    user 'vagrant'
    environment ({'HOME' => '/home/vagrant'})
    cwd '/home/vagrant/project/app'
    command 'npm install'
  end

  # migration
  execute 'npx sequelize-cli db:migrate' do
    user 'vagrant'
    environment ({'HOME' => '/home/vagrant'})
    cwd '/home/vagrant/project/app'
    command 'NODE_ENV=production npx sequelize-cli db:migrate && NODE_ENV=production npx sequelize-cli db:seed:all'
  end

  # Set up rc.d
  cookbook_file "expressjs_app" do
    path "/etc/init.d/expressjs_app"
  end
  execute 'set up rc.d' do
    user 'vagrant'
    environment ({'HOME' => '/home/vagrant'})
    cwd '/home/vagrant'
    command 'tr -d "\r" < /etc/init.d/expressjs_app > ~/expressjs_app && sudo mv ~/expressjs_app /etc/init.d/expressjs_app && sudo chmod 755 /etc/init.d/expressjs_app && sudo update-rc.d expressjs_app defaults'
  end

  # Reload nginx
  execute 'reload_nginx' do
    command 'sudo nginx -s reload'
  end

  execute 'start server' do
    user 'vagrant'
    environment ({'HOME' => '/home/vagrant'})
    cwd "/home/vagrant/project/app"
    command 'sudo service expressjs_app start'
  end
 end

