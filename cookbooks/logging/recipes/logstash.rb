apt_repository 'logstash' do
  uri 'http://packages.elastic.co/logstash/2.2/debian'
  components ['stable', 'main']
  key 'D88E42B4'
  keyserver 'pgp.mit.edu'
end

package 'logstash'

cookbook_file '/etc/default/logstash' do
  source 'logstash'
  mode '00644'
end

cookbook_file '/etc/logstash/conf.d/01-input.conf' do
  source '01-input.conf'
  mode '00644'
end

cookbook_file '/etc/logstash/conf.d/02-filter.conf' do
  source '02-filter.conf'
  mode '00644'
end

cookbook_file '/etc/logstash/conf.d/03-output.conf' do
  source '03-output.conf'
  mode '00644'
end

directory '/opt/logstash/patterns' do
  owner 'logstash'
  group 'logstash'
  mode '00775'
end

cookbook_file '/opt/logstash/patterns/nginx' do
  owner 'logstash'
  group 'logstash'
  source 'nginx'
  mode '00664'
end

service 'logstash' do
  action [:enable, :restart]
end
