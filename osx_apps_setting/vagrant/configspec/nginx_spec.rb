require_relative "spec_helper.rb"
 
describe package('nginx') do
  it { should be_installed }
end
