require 'socket'
require 'timeout'

ip = 'localhost'
port = 4443
flag = Socket::MSG_PEEK

client = UDPSocket.new
msg = ARGV[0]
client.send("udp socket test message", flag, ip, port)
client.connect(ip, port)
client.print ARGV[0]
client.print "finsh!"
Timeout.timeout(10) do
  time = client.gets
  puts time
end
