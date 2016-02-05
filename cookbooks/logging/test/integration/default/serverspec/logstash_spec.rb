require 'spec_helper'

describe 'logging::logstash' do
  describe package('logstash') do
    it { should be_installed }
  end

  describe service('logstash') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(5044) do
      it { should be_listening }
    end

    describe file('/etc/logstash/conf.d/01-input.conf') do
        it { should be_file }
    end

    describe file('/etc/logstash/conf.d/02-filter.conf') do
        it { should be_file }
    end

    describe file('/etc/logstash/conf.d/03-output.conf') do
        it { should be_file }
    end

    describe file('/opt/logstash/patterns/nginx') do
        it { should be_file }
        it { should be_owned_by 'logstash' }
    end
  end
end
