{Album} = require 'models/album'

class exports.Albums extends Backbone.Collection
  model: Album
  url: '/javascript/tunes/albums.json'
