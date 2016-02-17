require 'spec_helper'

describe 'monitoring::rabbitmq' do
  describe package('rabbitmq-server') do
    it { should be_installed }
  end

  describe service('rabbitmq-server') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(5672) do
      it { should be_listening }
    end

    describe command('rabbitmqctl list_vhosts') do
      its(:stdout) { should match /sensu/ }
    end

    describe command('rabbitmqctl list_users') do
      its(:stdout) { should match /sensu/ }
    end
  end
end
