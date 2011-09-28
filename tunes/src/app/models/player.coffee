{Playlist} = require 'collections/playlist'

class exports.Player extends Backbone.Model
  defaults:
    currentAlbumIndex: 0
    currentTrackIndex: 0
    state: 'stop'
  initialize: ->
    @playlist = new Playlist()
  play: ->
    @set 'state': 'play'
  stop: ->
    @set 'state': 'stop'
  isPlaying: ->
    @get 'state' == 'play'
  isStopped: ->
    !@isPlaying()
  currentAlbum: ->
    @playlist.at @get 'currentAlbumIndex'
  currentTrackUrl: ->
    album = @currentAlbum()
    album.trackUrlAtIndex @get 'currentTrackIndex'
