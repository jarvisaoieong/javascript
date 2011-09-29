albumTemplate = require 'templates/album'
{AlbumView} = require 'views/album_view'

class exports.PlaylistAlbumView extends AlbumView
  events:
    'click .queue.remove': 'removeFromPlaylist'
  initialize: ->
    _.bindAll @, 'remove'
    @model.bind 'remove', @remove
    @player = @options.player
    @player.bind 'change:state', @updateState
    @player.bind 'change:currentTrackIndex', @updateTrack
  render: =>
    @$(@el).html albumTemplate @model.toJSON()
    @updateTrack()
    @
  removeFromPlaylist: ->
    @options.playlist.remove @model
    @player.reset()
  updateState: =>
    isAlbumCurrent = (@player.currentAlbum() == @model)
    @$(@el).toggleClass 'current', isAlbumCurrent
  updateTrack: =>
    isAlbumCurrent = (@player.currentAlbum() == @model)
    if isAlbumCurrent
      currentTrackIndex = @player.get 'currentTrackIndex'
      @$('li').each (index, el) ->
        $(el).toggleClass 'current', index == currentTrackIndex
    @updateState()
