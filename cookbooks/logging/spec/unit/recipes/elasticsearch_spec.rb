require 'spec_helper'

describe 'logging::elasticsearch' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs elasticsearch package' do
    expect(chef_run).to install_package('elasticsearch')
  end

  it 'configures elasticsearch' do
    expect(chef_run).to render_file('/etc/elasticsearch/elasticsearch.yml')
    expect(chef_run).to render_file('/etc/default/elasticsearch')
  end
end
