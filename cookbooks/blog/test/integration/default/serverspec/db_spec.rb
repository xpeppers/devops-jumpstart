require 'spec_helper'

describe 'blog::db' do
  describe service('mysql') do
    it { should be_enabled  }
    it { should be_running  }

    it 'is listening on port 3306' do
      expect(port(3306)).to be_listening
    end

    describe file('/var/run/mysqld/mysqld.sock') do
      it { should be_socket }
    end

    describe 'posso database' do
      describe command("echo \'SHOW DATABASES LIKE 'blog'\' | mysql --user=blog --password=blog") do
        its(:stderr) { should match /blog/ }
      end
    end
  end
end
