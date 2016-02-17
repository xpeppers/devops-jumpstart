apt_repository 'redis' do
  uri 'ppa:chris-lea/redis-server'
  distribution node['lsb']['codename']
end

package 'redis-server'

cookbook_file '/etc/redis/redis.conf' do
  source 'redis.conf'
  mode '00644'
end

service 'redis-server' do
  action [:enable, :restart]
end
