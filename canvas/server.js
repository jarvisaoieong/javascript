(function() {
  var io;
  io = require('socket.io').listen(4000);
  io.sockets.on('connection', function(socket) {
    return socket.on('drawClick', function(data) {
      return socket.broadcast.emit('draw', {
        x: data.x,
        y: data.y,
        type: data.type
      });
    });
  });
}).call(this);
