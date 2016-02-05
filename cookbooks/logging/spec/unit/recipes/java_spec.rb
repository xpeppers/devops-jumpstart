require 'spec_helper'

describe 'logging::java' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs jre package' do
    expect(chef_run).to install_package('openjdk-7-jre-headless')
  end
end
