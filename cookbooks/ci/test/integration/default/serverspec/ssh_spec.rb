require 'spec_helper'

describe 'ci::ssh' do
  describe user('jenkins') do
    it { should exist }
    it { should have_home_directory '/var/lib/jenkins' }
  end

  describe file('/var/lib/jenkins/.ssh/id_rsa') do
    it { should be_mode 600 }
    it { should be_owned_by 'jenkins' }
  end

  describe x509_private_key('/var/lib/jenkins/.ssh/id_rsa') do
    it { should be_valid }
  end
end
