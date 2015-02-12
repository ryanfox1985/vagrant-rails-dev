%w(libmysqlclient-dev libpq-dev libsqlite3-dev curl graphviz).each do |pkg|
  package pkg do
    action :install
  end
end