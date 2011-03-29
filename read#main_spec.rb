require File.join(File.dirname(__FILE__),'read')

describe Read do
  
  describe "#new" do
    it "has a constructor that takes a hash to set hostname" do
      read = Read.new({:hostname => 'hi.com'})
      read.hostname.should == 'hi.com'
      read.valid?.should be_false
    end

    it "has a constructor that takes a hash to set port" do
      read = Read.new({:port => '8990'})
      read.port.should == '8990'
      read.valid?.should be_false
    end

    it "is valid with a port and hostname " do
      read = Read.new({:hostname => 'beans.com',:port => '25'})

      read.hostname.should == 'beans.com'
      read.port.should == '25'

      read.valid?.should be_true
    end
  end 

  describe "Read#main" do
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
end

