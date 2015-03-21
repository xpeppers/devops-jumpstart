require 'spec_helper'

describe 'blog::ruby' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs ruby' do
    expect(chef_run).to install_package('ruby2.2')
    expect(chef_run).to install_package('ruby2.2-dev')
  end

  it 'configures gemrc' do
    expect(chef_run).to create_file('/etc/gemrc')
  end

  it 'installs bundler gem' do
    expect(chef_run).to install_gem_package('bundler')
  end
end
