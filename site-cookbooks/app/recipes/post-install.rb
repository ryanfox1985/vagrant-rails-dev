template '/etc/network/interfaces' do
  source 'interfaces'
  owner 'root'
  group 'root'

  mode 0644
end

template '/vagrant/.vagrant/interfaces' do
  source 'interfaces'
  owner 'vagrant'
  group 'vagrant'

  mode 0644
end

execute 'Add vagrant to rvm group' do
  cwd '/home'
  user 'root'
  group 'root'
  action :run

  command 'usermod -a -G rvm vagrant'
end

execute 'change group rvm' do
  cwd '/home'
  user 'root'
  group 'root'
  action :run

  command 'chgrp rvm -R /usr/local/rvm/'
end

execute 'bundle-install' do
  cwd '/vagrant'
  user 'vagrant'
  group 'vagrant'
  action :run

  command 'bundle install --path /home/vagrant/.bundler'
end

# execute 'db-create' do
#   cwd '/vagrant'
#   user 'vagrant'
#   group 'vagrant'
#   action :run
#
#   command 'cd /vagrant; bundle exec rake db:create'
# end
#
# execute 'db-migrate' do
#   cwd '/vagrant'
#   user 'vagrant'
#   group 'vagrant'
#   action :run
#
#   command 'cd /vagrant; bundle exec rake db:migrate'
# end
