http = require 'http'
fs = require 'fs'
util = require 'util'
io = require 'socket.io'

server = http.createServer (req, res) ->
  res.writeHead 200,
    'Content-Type': 'text/html'
  rs = fs.createReadStream __dirname + '/index.html'
  util.pump rs, res
server.listen 4000

io = io.listen server
io.sockets.on 'connection', (socket) ->
  username = ''
  socket.send 'Welcome to socket.io chat room!'
  socket.send 'Please input your name:'

  socket.on 'message', (data) ->
    console.log data
    if not username
      username = data
      socket.send "Welcome #{username}"
    else
      io.sockets.send "#{username} sent > #{data}"

