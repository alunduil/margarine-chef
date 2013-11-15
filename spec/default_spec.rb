require 'spec_helper'
 
describe 'margarine::default' do
  let(:chef_run) do
    run = ChefSpec::ChefRunner.new(platform: 'ubuntu', version: '12.04')
    run.converge('margarine::default')
  end
 
  it 'creates the Margarine directory' do
    expect(chef_run).to create_directory('/etc/margarine')
  end

end