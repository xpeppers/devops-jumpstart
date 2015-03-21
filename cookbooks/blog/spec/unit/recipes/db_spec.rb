require 'spec_helper'

describe 'blog::db' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs mysql server' do
    expect(chef_run).to install_package('mysql-server-5.6')
  end

  it 'enables and starts mysql server' do
    expect(chef_run).to enable_service('mysql')
    expect(chef_run).to start_service('mysql')
  end

  it 'installs mysql gem' do
    expect(chef_run).to install_mysql2_chef_gem('default')
  end

  it 'creates blog database' do
    expect(chef_run).to create_mysql_database('blog')
  end

  it 'creates blog database user' do
    expect(chef_run).to create_mysql_database_user('blog')
    expect(chef_run).to grant_mysql_database_user('blog')
  end
end
