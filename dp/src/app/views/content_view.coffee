contentTemplate = require 'templates/content'
{ProjectorView} = require 'views/projector_view'
{VideoListView} = require 'views/video_list_view'

class exports.ContentView extends Backbone.View
  initialize: ->
    @projectorView = new ProjectorView
      model: @options.projector
    @videoListView = new VideoListView
      collection: @options.videoList
      projector: @options.projector
  render: =>
    @$(@el).html contentTemplate {}
    @$(@el).append @projectorView.render().el
    @$(@el).append @videoListView.render().el
    @projectorView.showProjector()
    @
