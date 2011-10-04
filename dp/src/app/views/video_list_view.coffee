{VideoView} = require 'views/video_view'

class exports.VideoListView extends Backbone.View
  id: 'video-list'
  initialize: ->
    @projector = @options.projector
    @collection.bind 'reset', @render
    @projector.bind 'inited', @showIntro
  render: =>
    $el = @$(@el)
    projector = @projector
    @collection.each (model) ->
      videoView = new VideoView
        model: model
        projector: projector
      $el.append videoView.render().el
    @
  showIntro: =>
    model = @collection.at 0
    @projector.trigger 'updateText', model
