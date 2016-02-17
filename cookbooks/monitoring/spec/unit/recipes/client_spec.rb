require 'spec_helper'

describe 'monitoring::client' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs sensu package' do
    expect(chef_run).to install_package('sensu')
    expect(chef_run).to install_gem_package('sensu-plugins-cpu-checks')
    expect(chef_run).to install_gem_package('sensu-plugins-disk-checks')
    expect(chef_run).to install_gem_package('sensu-plugins-nginx')
  end

  it 'configures sensu' do
    expect(chef_run).to render_file('/etc/sensu/config.json')
  end

  it 'starts sensu service' do
    expect(chef_run).to start_service('sensu-client')
  end
end
