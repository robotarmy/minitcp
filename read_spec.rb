require File.join(File.dirname(__FILE__), 'read')

describe Read do

  describe "open" do
    it " raises exception if invalid " do
      hostname = nil
      port = nil
      
      read = Read.main(hostname, port)
      lambda do
        read.open
      end.should raise_error(InvalidRead, "hostname and port must be specified")
    end

    it " to localhost port 9999 refuses connection (nothing there)" do
      hostname = "localhost"
      port = 9999

      read = Read.main(hostname, port)
      
      lambda do
        read.open
      end.should raise_error(InvalidRead, "hostname and port refused connection") 
    end

    it "connects to google.com port 80" do
      hostname = "google.com"
      port = 80
      mock_io = mock()

      read = Read.main(hostname, port)
      mock_io.should_receive(:read_nonblock).and_return("200","cat","meow")
      TCPSocket.should_receive(:open).with(hostname,port).and_return(mock_io)
      mock_io.should_receive(:close)
      output = read.open
      output.should match(/200/)
      output.should match(/cat/)
      output.should match(/meow/)
    end
  end
end


