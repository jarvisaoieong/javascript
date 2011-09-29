{AlbumView} = require 'views/album_view'

class exports.LibraryAlbumView extends AlbumView
  events:
    'click .queue.add': 'select'
  select: ->
    @collection.trigger 'select', @model
