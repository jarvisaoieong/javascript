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
    index = if location.hash then location.hash.replace /#/g, '' else 0
    model = @collection.at index
    app.models.projector.set
      model: model
