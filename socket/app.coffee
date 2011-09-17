app = require('express').createServer()
io = require('socket.io').listen app

app.listen 80

app.get '/', (req, res)->
    res.sendfile __dirname + '/index.html'

io.sockets.on 'connection', (socket)->
    socket.broadcast.emit 'login', socket.handshake.address.address
    socket.emit 'welcome', 'welcome to ERS socket.io chat room'
    socket.on 'message', (data)->
        console.log data
        socket.broadcast.emit 'data', 
            data: data
            ip: socket.handshake.address.address
