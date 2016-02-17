require 'spec_helper'

describe 'monitoring::grafana' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs grafana package' do
    expect(chef_run).to install_package('grafana')
  end

  it 'starts grafana service' do
    expect(chef_run).to restart_service('grafana-server')
  end
end
