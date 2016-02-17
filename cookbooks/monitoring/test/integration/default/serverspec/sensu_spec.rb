require 'spec_helper'

describe 'monitoring::sensu' do
  describe package('sensu') do
    it { should be_installed }
  end

  describe file('/etc/sensu/config.json') do
    it { should be_file }
  end

  describe file('/etc/sensu/uchiwa.json') do
    it { should be_file }
  end

  describe service('sensu-server') do
    it { should be_enabled  }
    it { should be_running  }
  end

  describe service('sensu-api') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(4567) do
      it { should be_listening }
    end
  end

  describe service('uchiwa') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(2000) do
      it { should be_listening }
    end
  end
end
