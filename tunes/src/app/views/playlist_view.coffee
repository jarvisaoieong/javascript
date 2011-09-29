playlistTemplate = require 'templates/playlist'
{PlaylistAlbumView} = require 'views/playlist_album_view'

class exports.PlaylistView extends Backbone.View
  tagName: 'section'
  className: 'playlist'
  events:
    'click .play': 'play'
    'click .pause': 'pause'
    'click .next': 'nextTrack'
    'click .prev': 'prevTrack'
  initialize: ->
    @collection.bind 'reset', @render
    @collection.bind 'add', @renderAlbum

    @player = @options.player
    @player.bind 'change:state', @updateState
    @player.bind 'change:currentTrackIndex', @updateTrack

    @library = @options.library
    @library.bind 'select', @queueAlbum

    @audio = new Audio()
  render: =>
    @$(@el).html playlistTemplate @player.toJSON()
    @$('button.play').toggle @player.isStopped()
    @$('button.pause').toggle @player.isPlaying()
    @
  queueAlbum: (album) =>
    @collection.add album
  renderAlbum: (album) =>
    view = new PlaylistAlbumView
      model: album
      player: @player
      playlist: @collection
    @$('ul').append view.render().el
  updateState: =>
    @updateTrack()
    @$('button.play').toggle @player.isStopped()
    @$('button.pause').toggle @player.isPlaying()
  updateTrack: =>
    @audio.src = "/javascript/tunes/#{@player.currentTrackUrl()}"
    if (@player.get 'state') == 'play'
      @audio.play()
    else
      @audio.pause()
  play: =>
    @player.play()
  pause: =>
    @player.pause()
  nextTrack: =>
    @player.nextTrack()
  prevTrack: =>
    @player.prevTrack()
