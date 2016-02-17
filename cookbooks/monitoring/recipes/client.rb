apt_repository 'sensu' do
  uri 'http://repos.sensuapp.org/apt'
  components ['sensu', 'main']
  key 'http://repos.sensuapp.org/apt/pubkey.gpg'
end

package 'sensu'

gem_package 'sensu-plugins-cpu-checks'
gem_package 'sensu-plugins-disk-checks'
gem_package 'sensu-plugins-nginx'

template '/etc/sensu/config.json' do
  source 'client-config.json.erb'
  mode '00644'
  variables host: node['monitoring']['host']
end

service 'sensu-client' do
  action [:enable, :start]
end
