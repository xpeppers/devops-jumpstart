version = node['blog']['mysql']['version']
package "mysql-server-#{version}"

mysql2_chef_gem 'default' do
  client_version version
  action :install
end

file '/etc/mysql/my.cnf' do
  source 'my.cnf'
end

service 'mysql' do
  provider Chef::Provider::Service::Init::Debian
  action [:enable, :start]
end

connection_info = {
  host: 'localhost',
  username: 'root',
  password: ''
}

mysql_database node['blog']['database']['name'] do
  connection connection_info
  action :create
end

mysql_database_user node['blog']['database']['user'] do
  connection connection_info
  database_name node['blog']['database']['name']
  password node['blog']['database']['password']
  privileges [:all]
  action [:create, :grant]
end
