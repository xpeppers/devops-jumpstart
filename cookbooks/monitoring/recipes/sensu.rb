apt_repository 'sensu' do
  uri 'http://repos.sensuapp.org/apt'
  components ['sensu', 'main']
  key 'http://repos.sensuapp.org/apt/pubkey.gpg'
end

package 'sensu'

gem_package 'em-http-request' do
  gem_binary '/opt/sensu/embedded/bin/gem'
end

cookbook_file '/etc/sensu/config.json' do
  source 'config.json'
  mode '00644'
end

remote_file '/etc/sensu/extensions/influxdb.rb' do
  source 'https://raw.githubusercontent.com/seegno/sensu-influxdb-extension/master/influxdb.rb'
end

cookbook_file '/etc/sensu/uchiwa.json' do
  source 'uchiwa.json'
  mode '00644'
end

service 'sensu-server' do
  action [:enable, :start]
end

service 'sensu-api' do
  action [:enable, :start]
end

package 'uchiwa'

service 'uchiwa' do
  action [:enable, :restart]
end
