apt_repository 'elasticsearch' do
  uri 'http://packages.elastic.co/elasticsearch/2.x/debian'
  components ['stable', 'main']
  key 'D88E42B4'
  keyserver 'pgp.mit.edu'
end

package 'elasticsearch'

cookbook_file '/etc/elasticsearch/elasticsearch.yml' do
  source 'elasticsearch.yml'
  mode '00644'
end

cookbook_file '/etc/default/elasticsearch' do
  source 'elasticsearch'
  mode '00644'
end

service 'elasticsearch' do
  action [:enable, :restart]
end
