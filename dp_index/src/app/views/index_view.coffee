indexTemplate = require 'templates/index'
{ProjectorView} = require 'views/projector_view'
{VideoListView} = require 'views/video_list_view'
{PigeonView} = require 'views/pigeon_view'

class exports.IndexView extends Backbone.View
  initialize: ->
    @projectorView = new ProjectorView
      model: app.models.projector
    @videoListView = new VideoListView
      collection: app.collections.videoList
    @pigeonView = new PigeonView
      model: app.models.pigeon
  render: =>
    @$(@el).html indexTemplate()
    @$(@el).append @pigeonView.render().el
    @$(@el).append @projectorView.render().el
    @$(@el).append @videoListView.render().el
    @
