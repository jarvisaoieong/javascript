(function() {
  var app, io;
  app = require('express').createServer();
  io = require('socket.io').listen(app);
  app.listen(80);
  app.get('/', function(req, res) {
    return res.sendfile(__dirname + '/index.html');
  });
  io.sockets.on('connection', function(socket) {
    socket.broadcast.emit('login', socket.handshake.address.address);
    socket.emit('welcome', 'welcome to ERS socket.io chat room');
    return socket.on('message', function(data) {
      console.log(data);
      return socket.broadcast.emit('data', {
        data: data,
        ip: socket.handshake.address.address
      });
    });
  });
}).call(this);
