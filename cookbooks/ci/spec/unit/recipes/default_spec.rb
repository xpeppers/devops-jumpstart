require 'spec_helper'

describe 'ci::default' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'includes needed recipes' do
    expect(chef_run).to include_recipe('ci::jenkins')
    expect(chef_run).to include_recipe('ci::ssh')
  end
end
