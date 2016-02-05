apt_repository 'kibana' do
  uri 'http://packages.elastic.co/kibana/4.4/debian'
  components ['stable', 'main']
  key 'D88E42B4'
  keyserver 'pgp.mit.edu'
end

package 'kibana'

service 'kibana' do
  action [:enable, :restart]
end
