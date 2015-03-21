require 'spec_helper'

describe 'ci::ssh' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'creates .ssh dir' do
    expect(chef_run).to create_directory('/var/lib/jenkins/.ssh').with(mode: 0755)
  end

  it 'creates private key' do
    expect(chef_run).to create_cookbook_file('/var/lib/jenkins/.ssh/id_rsa').with(mode: 0600)
  end
end
