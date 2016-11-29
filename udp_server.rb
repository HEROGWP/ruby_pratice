require 'socket'
socket = UDPSocket.new
socket.bind('',4443)
loop do
  msg, sender = socket.recvfrom(100)
  host = sender[3]
  puts "#{Time.now}: #{host} '#{msg}'"
  socket.send(Time.new.to_s  + " #{sender.inspect} -- ##{sender[1]}" + "\n", 0, sender[3], sender[1])
end
