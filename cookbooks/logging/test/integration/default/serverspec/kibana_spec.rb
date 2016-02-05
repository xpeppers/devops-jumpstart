require 'spec_helper'

describe 'logging::kibana' do
  describe package('kibana') do
    it { should be_installed }
  end

  describe service('kibana') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(5601) do
      it { should be_listening }
    end
  end
end
