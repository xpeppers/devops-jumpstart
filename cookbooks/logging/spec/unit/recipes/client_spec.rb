require 'spec_helper'

describe 'logging::client' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs filebeat package' do
    expect(chef_run).to install_package('filebeat')
  end

  it 'configures filebeat' do
    expect(chef_run).to render_file('/etc/filebeat/filebeat.yml')
  end
end
