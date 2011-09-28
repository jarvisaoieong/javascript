{Albums} = require 'collections/albums'

class exports.Playlist extends Albums
  isFirstAlbum: (index) ->
    index == 0
  isLastAlbum: (index) ->
    index == (@models.length - 1)
