include_recipe 'apt'

package 'openjdk-7-jre-headless'

include_recipe 'jenkins::master'

cookbook_file '/etc/default/jenkins' do
  source 'jenkins'
end

jenkins_plugin 'delivery-pipeline-plugin'
jenkins_plugin 'build-pipeline-plugin' do
  notifies :restart, 'service[jenkins]'
end

group 'vagrant' do
  action :modify
  members 'jenkins'
  append true
  notifies :restart, 'service[jenkins]'
end
