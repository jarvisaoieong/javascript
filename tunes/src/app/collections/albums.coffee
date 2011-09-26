{Album} = require 'models/album'

class Albums extends Backbone.Collection
  model: Album
  url: '/albums'
