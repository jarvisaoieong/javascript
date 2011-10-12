{VideoView} = require 'views/video_view'

class exports.VideoListView extends Backbone.View
  id: 'video-list'
  initialize: ->
    @collection.bind 'reset', @render
    app.models.projector.bind 'show', @showIntro
  render: =>
    $el = @$(@el)
    @collection.each (model) ->
      videoView = new VideoView
        model: model
      $el.append videoView.render().el
    @
  showIntro: =>
    model = @collection.at 0
    app.models.projector.set
      model: model
