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
end
