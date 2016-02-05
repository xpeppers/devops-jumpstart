require 'spec_helper'

describe 'ci::jenkins' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'includes needed recipes' do
    expect(chef_run).to include_recipe('apt')
    expect(chef_run).to include_recipe('jenkins::master')
  end

  it 'installs jre' do
    expect(chef_run).to install_package('openjdk-7-jre-headless')
  end

  it 'installs jenkins plugin' do
    expect(chef_run).to install_jenkins_plugin('delivery-pipeline-plugin')
    expect(chef_run).to install_jenkins_plugin('build-pipeline-plugin')
  end

  it 'add jenkins to vagrant group' do
    expect(chef_run).to modify_group('vagrant').with(members: ['jenkins'])
    expect(chef_run.group('vagrant')).to notify('service[jenkins]').to(:restart)
  end
end
