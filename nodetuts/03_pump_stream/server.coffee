http = require 'http'
fs = require 'fs'
util =  require 'util'

file_path = __dirname + '/candy.jpg'

fs.stat file_path, (err, stat) ->
  server = http.createServer (req, res) ->
    res.writeHead 200,
      'Content-Type': 'image/jpeg'
      'Content-Length': stat.size

    readStream = fs.createReadStream file_path

    util.pump readStream, res, (err) ->
      throw err if err

  server.listen 4000
