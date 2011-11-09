http = require 'http'
fs = require 'fs'
util = require 'util'
ws = require './ws.js'

http.createServer (req, res) ->
  res.writeHead 200,
    'Content-Type': 'text/html'
  rs = fs.createReadStream __dirname + '/index.html'
  util.pump rs, res
.listen 4000

clients = []
ws.createServer (websocket) ->
  username = ''
  websocket.on 'connect', (resource) ->
    clients.push websocket
    websocket.write 'Welcome to this chat server!'
    websocket.write 'Please input your usesrname.'
    console.log 'connect'
  websocket.on 'data', (data) ->
    unless username
      username = data.toString()
      websocket.write "Welcome, #{username}!"
    feedback = "#{username} said: #{data.toString()}"
    client.write feedback for client in clients
  websocket.on 'close', ->
    pos = clients.indexOf websocekt
    clients.splice pos, 1 if pos >= 0
.listen 8000

