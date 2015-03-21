ssh_dir = node['jenkins']['master']['home'] + '/.ssh'

directory ssh_dir do
  owner 'jenkins'
  mode 0755
  action :create
  not_if { File.exists? ssh_dir }
end

cookbook_file "#{ssh_dir}/id_rsa" do
  source 'id_rsa'
  owner 'jenkins'
  mode 0600
  action :create
end

cookbook_file "#{ssh_dir}/id_rsa.pub" do
  source 'id_rsa.pub'
  owner 'jenkins'
  mode 0600
  action :create
end
