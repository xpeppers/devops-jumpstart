require 'spec_helper'

describe 'logging::kibana' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs kibana package' do
    expect(chef_run).to install_package('kibana')
  end

  it 'configures kibana' do
  end
end
