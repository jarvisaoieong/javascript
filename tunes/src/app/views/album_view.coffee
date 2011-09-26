albumTemplate = require 'templates/album'

class exports.AlbumView extends Backbone.View
  tagName: 'li'
  className: 'album'
  initialize: ->
    @model.bind 'change', @render
  render: =>
    @$(@el).html albumTemplate @model.toJSON()
    @
