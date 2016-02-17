require 'spec_helper'

describe 'monitoring::grafana' do
  describe package('grafana') do
    it { should be_installed }
  end

  describe service('grafana-server') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(3000) do
      it { should be_listening }
    end
  end
end
