mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password node['mysql']['server_root_password']
  action :create
end

template '/etc/mysql/my.cnf' do
  source 'my.cnf.erb'
  owner 'mysql'
  group 'mysql'

  mode 0600
end

execute 'mysql-start' do
  cwd '/home/vagrant'
  user 'root'
  group 'root'
  action :run

  command 'service mysql start'
end

execute 'mysql-on-startup' do
  cwd '/home/vagrant'
  user 'root'
  group 'root'
  action :run

  command 'update-rc.d mysql defaults'
end

execute 'mysql-privileges' do
  cwd '/home/vagrant'
  user 'root'
  group 'root'
  action :run

  command "mysql -u root -e \"GRANT ALL ON *.* to root@'%' IDENTIFIED BY '#{node['mysql']['server_root_password']}';
          GRANT ALL ON *.* to root@'localhost' IDENTIFIED BY '#{node['mysql']['server_root_password']}';
          FLUSH PRIVILEGES;\""
end
