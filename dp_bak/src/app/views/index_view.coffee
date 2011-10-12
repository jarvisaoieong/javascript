indexTemplate = require 'templates/index'
{ProjectorView} = require 'views/projector_view'
{VideoListView} = require 'views/video_list_view'

class exports.IndexView extends Backbone.View
  initialize: ->
    @projectorView = new ProjectorView
      model: app.models.projector
    @videoListView = new VideoListView
      collection: app.collections.videoList
      projector: @options.projector
  render: =>
    @$(@el).html indexTemplate()
    @$(@el).append @projectorView.render().el
    @$(@el).append @videoListView.render().el
    @
