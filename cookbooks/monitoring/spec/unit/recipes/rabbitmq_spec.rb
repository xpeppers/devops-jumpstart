require 'spec_helper'

describe 'monitoring::rabbitmq' do
  let(:chef_run) do
    stub_command('rabbitmqctl list_vhosts | grep /sensu').and_return(false)
    stub_command('rabbitmqctl list_users | grep sensu').and_return(false)

    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs rabbitmq package' do
    expect(chef_run).to install_package('rabbitmq-server')
  end

  it 'configures rabbitmq' do
    expect(chef_run).to render_file('/etc/rabbitmq/rabbitmq.config')
  end

  it 'starts rabbitmq service' do
    expect(chef_run).to restart_service('rabbitmq-server')
  end

  it 'initializes sensu vhost' do
    expect(chef_run).to run_execute('rabbitmqctl add_vhost /sensu')
    expect(chef_run).to run_execute('rabbitmqctl add_user sensu sensu')
  end
end
