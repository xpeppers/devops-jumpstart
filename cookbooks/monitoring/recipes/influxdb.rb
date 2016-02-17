apt_repository 'influxdb' do
  uri 'https://repos.influxdata.com/debian'
  components ['jessie', 'stable']
  key 'https://repos.influxdata.com/influxdb.key'
end

package 'influxdb'

service 'influxdb' do
  action [:enable, :restart]
end

execute 'influx -execute "create database sensu"' do
  retries 2
end
