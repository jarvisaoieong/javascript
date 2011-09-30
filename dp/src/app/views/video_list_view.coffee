{VideoView} = require 'views/video_view'

class exports.VideoListView extends Backbone.View
  id: 'video-list'
  initialize: ->
    @collection.bind 'reset', @render
    @projector = @options.projector
  render: =>
    $el = @$(@el)
    projector = @projector
    @collection.each (model) ->
      videoView = new VideoView
        model: model
        projector: projector
      $el.append videoView.render().el
    @
