window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

MainRouter = require('routers/main_router').MainRouter
HomeView = require('views/home_view').HomeView
{Album} = require 'models/album'
{Player} = require 'models/player'
{Albums} = require 'collections/albums'
{AlbumView} = require 'views/album_view'
{LibraryView} = require 'views/library_view'
{PlaylistView} = require 'views/playlist_view'

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()
    app.views.home = new HomeView()
    app.collections.library = new Albums()
    app.models.player = new Player()
    app.views.libraryView = new LibraryView
      collection: app.collections.library
    app.views.playlistView = new PlaylistView
      collection: app.models.player.playlist
      player: app.models.player
      library: app.collections.library

    app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
