require 'spec_helper'

describe 'tmutil' do
  let(:params) { {:user =>'User1', :password => 'test', :server => 'xserve.example.com', :share => 'TimeMachines' } }

  it 'enable tmutil' do 
  	should contain_exec('EnableTmutil').only_with_command("/usr/bin/tmutil enable")
  end

  it 'should set destination to xserve.example.com/TimeMachines' do
  	should contain_exec("SetUser1BackupDestination").only_with(
  		'command' => '/usr/bin/tmutil setdestination afp://User1:test@xserve.example.com/TimeMachines',
  		'require' => 'Exec[EnableTmutil]',
  	)
  end

end