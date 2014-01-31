require 'spec_helper'

describe 'tmutil::exclude', :type => :define do 
  let(:title) { '/Applications'}

  it 'should exclude passed in title' do
  	should contain_exec('TmutilExclude').only_with_command('/usr/bin/tmutil addexclusion /Applications')
  end
end