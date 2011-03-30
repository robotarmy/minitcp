require 'socket'

class InvalidRead < StandardError
end
class Read
  attr_reader :hostname, :port

  def initialize( options = {})
    @hostname = options[:hostname]
    @port =  options[:port]
  end

  def Read.main(hostname = nil, port = nil)
    Read.new({:hostname => hostname, :port => port})
  end

  def valid?
    @hostname && @port  
  end

  def open
    if !valid?
      raise InvalidRead.new("hostname and port must be specified")
    end
    sock = TCPSocket.new(self.hostname, self.port)
    sock.read_nonblock(1024)
    rescue Errno::ECONNREFUSED
      raise InvalidRead.new("hostname and port refused connection")
    ensure
      sock.close if sock
  end
end
