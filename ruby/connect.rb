require 'socket.io-client-simple'

socket = SocketIO::Client::Simple.connect "https://#{ENV["URL"]}:#{ENV["PORT"]}"

socket.on :connect do
  socket.emit :psubscribe, ENV["REALTIME_CHANNEL"]
  puts "connect!!!"
end

socket.on :disconnect do
  puts "disconnected!!"
end

loop do
  msg = STDIN.gets.strip
  next if msg.empty?
end