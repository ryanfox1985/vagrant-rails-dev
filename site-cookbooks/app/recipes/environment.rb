execute 'database-db' do
  cwd '/home/vagrant'
  user 'vagrant'
  action :run
  command "echo 'export RAILS_DB=#{node['mysql']['server_type']}' > .bash_profile"
end

execute 'database-name' do
  cwd '/home/vagrant'
  user 'vagrant'
  action :run
  command "echo 'export OPENSHIFT_APP_NAME=#{node['mysql']['server_database']}' >> .bash_profile"
end

execute 'database-user' do
  cwd '/home/vagrant'
  user 'vagrant'
  action :run
  command "echo 'export OPENSHIFT_MYSQL_DB_USERNAME=#{node['mysql']['server_root_user']}' >> .bash_profile"
end

execute 'database-pass' do
  cwd '/home/vagrant'
  user 'vagrant'
  action :run
  command "echo 'export OPENSHIFT_MYSQL_DB_PASSWORD=#{node['mysql']['server_root_password']}' >> .bash_profile"
end

execute 'database-host' do
  cwd '/home/vagrant'
  user 'vagrant'
  action :run
  command "echo 'export OPENSHIFT_MYSQL_DB_HOST=#{node['mysql']['server_host']}' >> .bash_profile"
end

execute 'database-port' do
  cwd '/home/vagrant'
  user 'vagrant'
  action :run
  command "echo 'export OPENSHIFT_MYSQL_DB_PORT=#{node['mysql']['server_port']}' >> .bash_profile"
end
