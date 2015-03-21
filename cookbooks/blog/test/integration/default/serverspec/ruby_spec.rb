require 'spec_helper'

describe 'blog::ruby' do
  describe package('ruby2.2') do
    it { should be_installed }
  end

  describe 'bundler is installed' do
    describe command('gem list bundler -i') do
      its(:stdout) { should match /true/ }
    end
  end
end
