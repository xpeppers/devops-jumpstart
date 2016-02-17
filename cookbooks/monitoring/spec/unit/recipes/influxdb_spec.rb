require 'spec_helper'

describe 'monitoring::influxdb' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs influxdb package' do
    expect(chef_run).to install_package('influxdb')
  end

  it 'starts influxdb service' do
    expect(chef_run).to restart_service('influxdb')
  end
end
