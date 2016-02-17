require 'spec_helper'

describe 'monitoring::client' do
  describe package('sensu') do
    it { should be_installed }
  end

  describe command('gem list sensu-plugins-cpu-checks -i') do
    its(:stdout) { should match /true/ }
  end

  describe command('gem list sensu-plugins-disk-checks -i') do
    its(:stdout) { should match /true/ }
  end

  describe command('gem list sensu-plugins-nginx -i') do
    its(:stdout) { should match /true/ }
  end

  describe file('/etc/sensu/config.json') do
    it { should be_file }
  end

  describe service('sensu-client') do
    it { should be_enabled  }
    it { should be_running  }
  end
end
