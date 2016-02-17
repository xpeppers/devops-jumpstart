apt_repository 'grafana' do
  uri 'https://packagecloud.io/grafana/stable/debian'
  components ['wheezy', 'main']
  key 'https://packagecloud.io/gpg.key'
end

package 'grafana'

service 'grafana-server' do
  action [:enable, :restart]
end
