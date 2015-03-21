require 'spec_helper'

describe 'blog::web' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'installs nginx' do
    expect(chef_run).to install_package('nginx')
  end

  it 'creates nginx site configuration' do
    expect(chef_run).to render_file('/etc/nginx/sites-available/blog.com')
    expect(chef_run).to create_link('/etc/nginx/sites-enabled/blog.com')
  end

  it 'enables and starts nginx' do
    expect(chef_run).to enable_service('nginx')
    expect(chef_run).to start_service('nginx')
  end
end
