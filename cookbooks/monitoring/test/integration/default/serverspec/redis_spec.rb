require 'spec_helper'

describe 'monitoring::redis' do
  describe package('redis-server') do
    it { should be_installed }
  end

  describe service('redis-server') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(6379) do
      it { should be_listening }
    end
  end
end
