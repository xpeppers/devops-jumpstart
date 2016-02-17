apt_repository 'beats' do
  uri 'http://packages.elastic.co/beats/apt'
  components ['stable', 'main']
  key 'D88E42B4'
  keyserver 'pgp.mit.edu'
end

package 'filebeat'

template '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml.erb'
  mode '00644'
  variables host: node['logging']['host']
end

service 'filebeat' do
  action [:enable, :restart]
end
