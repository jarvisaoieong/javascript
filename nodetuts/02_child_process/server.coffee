http = require 'http'
{spawn} = require 'child_process'

server = http.createServer (req, res) ->
  res.writeHead 200,
    'Content-Type': 'text/html'
  tail_child = spawn 'tail', ['-f', '/var/log/system.log']
  tail_child.stdout.on 'data', (data) ->
    res.write data
  req.connection.on 'end', ->
    tail_child.kill()

server.listen 4000
