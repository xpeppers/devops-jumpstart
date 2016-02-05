require 'spec_helper'

describe 'logging::java' do
  describe package('openjdk-7-jre-headless') do
    it { should be_installed }
  end
end
