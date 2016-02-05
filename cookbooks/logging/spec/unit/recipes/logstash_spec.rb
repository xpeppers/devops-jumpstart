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
    expect(chef_run).to render_file('/etc/logstash/conf.d/input.conf')
    expect(chef_run).to render_file('/etc/logstash/conf.d/filter.conf')
    expect(chef_run).to render_file('/etc/logstash/conf.d/output.conf')
  end
end
