require 'configspec'
require 'pathname'
require 'net/ssh'
 
include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS
 
$ vi ~/configspec/nginx_spec.rb
require_relative "spec_helper.rb"
 
describe package('nginx') do
  it { should be_installed }
end
