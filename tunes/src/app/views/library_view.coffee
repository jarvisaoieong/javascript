libraryTemplate = require 'templates/library'
{LibraryAlbumView} = require 'views/library_album_view'

class exports.LibraryView extends Backbone.View
  tagName: 'section'
  className: 'library'
  initialize: ->
    @collection.bind 'reset', @render
  render: =>
    @$(@el).html libraryTemplate {}
    collection = @collection
    $albums = @$ '.albums'

    collection.each (album) ->
      view = new LibraryAlbumView
        model: album
        collection: collection
      $albums.append view.render().el
    @
