const io = require('socket.io-client');

const socket = io(
  `https://${process.env.URL}:${process.env.PORT}`,
  {
    secure: true,
    rejectUnauthorized: false
  }
)

socket.on('connect', function() {
  console.log('connect')

  socket.emit('psubscribe', process.env.REALTIME_CHANNEL)
});

socket.on('message', function(data) {
  console.log('message', data)
});

socket.on('disconnect', function() {
  console.log('disconnect')
});

socket.on('error', function(err) {
  console.log(err)
})

socket.connect()
