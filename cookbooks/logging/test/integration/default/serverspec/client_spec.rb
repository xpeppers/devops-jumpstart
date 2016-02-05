require 'spec_helper'

describe 'logging::filebeat' do
  describe package('filebeat') do
    it { should be_installed }
  end

  describe service('filebeat') do
    it { should be_enabled  }
    it { should be_running  }
  end
end
