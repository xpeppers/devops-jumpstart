apt_repository 'rabbitmq' do
  uri 'http://www.rabbitmq.com/debian'
  components ['testing', 'main']
  key '056E8E56'
  keyserver 'pgp.mit.edu'
end

package 'rabbitmq-server'

cookbook_file '/etc/rabbitmq/rabbitmq.config' do
  source 'rabbitmq.config'
  mode '00644'
end

service 'rabbitmq-server' do
  action [:enable, :restart]
end

execute 'rabbitmqctl add_vhost /sensu' do
  not_if 'rabbitmqctl list_vhosts | grep /sensu'
end
execute 'rabbitmqctl add_user sensu sensu' do
  not_if 'rabbitmqctl list_users | grep sensu'
end
execute 'rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"'

