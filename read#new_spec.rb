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
end

