require 'test/spec'

context Test do

  specify 'Startup' do
      defined? url
      defined? scriptversion
      defined? my_name
    true.should == false
  end
end