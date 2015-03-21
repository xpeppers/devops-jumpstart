require 'spec_helper'

describe 'blog::default' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'includes needed recipes' do
    expect(chef_run).to include_recipe('apt')
    expect(chef_run).to include_recipe('blog::web')
    expect(chef_run).to include_recipe('blog::db')
    expect(chef_run).to include_recipe('blog::ruby')
  end
end
