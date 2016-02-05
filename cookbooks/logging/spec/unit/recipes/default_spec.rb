require 'spec_helper'

describe 'logging::default' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'includes needed recipes' do
    expect(chef_run).to include_recipe('apt')
    expect(chef_run).to include_recipe('logging::java')
  end
end
