{Playlist} = require 'collections/playlist'

class exports.Player extends Backbone.Model
  defaults:
    currentAlbumIndex: 0
    currentTrackIndex: 0
    state: 'stop'
  initialize: ->
    @playlist = new Playlist()
  reset: ->
    @set
      currentAlbumIndex: 0
      currentTrackIndex: 0
      state: 'stop'
  play: ->
    @set 'state': 'play'
  pause: ->
    @set 'state': 'pause'
  isPlaying: ->
    (@get 'state') == 'play'
  isStopped: ->
    !@isPlaying()
  currentAlbum: ->
    @playlist.at @get 'currentAlbumIndex'
  currentTrackUrl: ->
    album = @currentAlbum()
    if album
      album.trackUrlAtIndex @get 'currentTrackIndex'
    else
      null
  nextTrack: ->
    currentAlbumIndex = @get 'currentAlbumIndex'
    currentTrackIndex = @get 'currentTrackIndex'
    if @currentAlbum().isLastTrack currentTrackIndex
      if @playlist.isLastAlbum currentAlbumIndex
        @set 'currentAlbumIndex': 0
        @set 'currentTrackIndex': 0
      else
        @set 'currentAlbumIndex': currentAlbumIndex + 1
        @set 'currentTrackIndex': 0
    else
      @set 'currentTrackIndex': currentTrackIndex + 1
    @logCurrentAlbumAndTrack()

  prevTrack: ->
    currentAlbumIndex = @get 'currentAlbumIndex'
    currentTrackIndex = @get 'currentTrackIndex'
    lastModelIndex = 0
    if @currentAlbum().isFirstTrack currentTrackIndex
      if @playlist.isFirstAlbum currentAlbumIndex
        lastModelIndex = @playlist.models.length - 1
        @set 'currentAlbumIndex': lastModelIndex
      else
        @set 'currentAlbumIndex': currentAlbumIndex - 1
      lastTrackIndex = @currentAlbum().get('tracks').length - 1
      @set 'currentTrackIndex': lastTrackIndex
    else
      @set 'currentTrackIndex': currentTrackIndex - 1
    @logCurrentAlbumAndTrack()

  logCurrentAlbumAndTrack: ->
    console.log "Player #{@get 'currentAlbumIndex'}:#{@get 'currentTrackIndex'},#{@}"
