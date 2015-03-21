require 'spec_helper'

describe 'ci::jenkins' do
  describe service('jenkins') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(8080) do
      it { should be_listening }
    end
  end
end
