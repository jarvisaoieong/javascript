net = require 'net'
carrier = require 'carrier'

connections = []

net.createServer (conn) ->
  connections.push conn

  conn.on 'close', ->
    pos = connections.indexOf conn
    connections.splice pos, 1 if pos >= 0

  conn.write 'Hello, welcome to this chat server!\n'
  conn.write 'Please input your user name:\n'

  username = ''
  carrier.carry conn, (line) ->
    if not username
      username = line
      conn.write "Hello #{username}!\n"
    conn.end if line is 'quit'
    for one_connection in connections
      one_connection.write "#{username}: #{line}\n"
.listen 4000
    
