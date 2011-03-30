require 'socket'
handle = TCPServer.open(9999)
loop do
  connection = handle.accept 
  connection.puts(Time.now.to_i)
  connection.puts("Closing connection")
  connection.close
end

