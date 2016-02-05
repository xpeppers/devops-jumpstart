apt_repository 'beats' do
  uri 'http://packages.elastic.co/beats/apt'
  components ['stable', 'main']
  key 'D88E42B4'
  keyserver 'pgp.mit.edu'
end

package 'filebeat'

cookbook_file '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml'
  mode '00644'
end

service 'filebeat' do
  action [:enable, :restart]
end
