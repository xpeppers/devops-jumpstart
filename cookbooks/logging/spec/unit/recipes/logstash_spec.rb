require 'spec_helper'

describe 'logging::logstash' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs logstash package' do
    expect(chef_run).to install_package('logstash')
  end

  it 'configures logstash' do
    expect(chef_run).to render_file('/etc/default/logstash')
    expect(chef_run).to render_file('/etc/logstash/conf.d/01-input.conf')
    expect(chef_run).to render_file('/etc/logstash/conf.d/02-filter.conf')
    expect(chef_run).to render_file('/etc/logstash/conf.d/03-output.conf')
  end
end
