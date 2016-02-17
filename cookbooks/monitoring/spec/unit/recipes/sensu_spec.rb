require 'spec_helper'

describe 'monitoring::sensu' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs sensu package' do
    expect(chef_run).to install_package('sensu')
  end

  it 'configures sensu' do
    expect(chef_run).to render_file('/etc/sensu/config.json')
    expect(chef_run).to render_file('/etc/sensu/uchiwa.json')
  end

  it 'starts sensu service' do
    expect(chef_run).to start_service('sensu-server')
  end

  it 'starts sensu api service' do
    expect(chef_run).to start_service('sensu-api')
  end

  it 'installs uchiwa package' do
    expect(chef_run).to restart_service('uchiwa')
  end

  it 'starts uchiwa service' do
    expect(chef_run).to restart_service('uchiwa')
  end
end
