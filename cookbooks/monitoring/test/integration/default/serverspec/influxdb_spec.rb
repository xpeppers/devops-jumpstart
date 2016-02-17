require 'spec_helper'

describe 'monitoring::influxdb' do
  describe package('influxdb') do
    it { should be_installed }
  end

  describe service('influxdb') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(8086) do
      it { should be_listening }
    end
  end
end
