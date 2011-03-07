require File.join(File.dirname(__FILE__),'read')

describe Read do
  it "has a command line interpreter named #main" do
    Read.respond_to?(:main)
  end

  it "#main returns a new instance of Read" do
    Read.main.should_not be_nil
  end

  it "#main returns an instance of read that responds to #vaild" do
    Read.main.valid?.should be_false
  end 
  it " given first command line argument will set hostname"  do
      r = Read.main("localhost") 
      r.hostname.should == 'localhost'
      r.valid?.should be_false
  end
  it " given first argument,  second command line argument will set port" do
      r = Read.main("localhost", "80") 
      r.hostname.should == 'localhost'
      r.port.should == '80'
  end

  it " given two arguments to main is valid" do
      r = Read.main("localhost", "80") 
      r.valid?.should be_true
  end
end

