http = require 'http'
fs = require 'fs'
step = require 'step'

file_path = __dirname + '/candy.jpg'
file_size = null

step get_file_size = ->
  fs.stat file, @
, store_file_size = (err, stat) ->
  file_size = stat.size
  @
, read_file_into_memory = ->
  fs.readFile file_path, @
, create_server = (err, file_content) ->
  throw err if err
  http.createServer (req, res) ->
    res.writeHead 200,
      'Content-Type': 'image/jpeg'
      'Content-Length': file_size
    res.end file_content
  .listen 4000
