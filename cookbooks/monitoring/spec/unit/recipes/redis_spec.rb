require 'spec_helper'

describe 'monitoring::redis' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.automatic['lsb']['codename'] = 'trusty'
    end.converge(described_recipe)
  end

  it 'installs redis package' do
    expect(chef_run).to install_package('redis-server')
  end

  it 'starts redis service' do
    expect(chef_run).to restart_service('redis-server')
  end
end
