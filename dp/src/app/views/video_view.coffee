videoTemplate = require 'templates/video'

class exports.VideoView extends Backbone.View
  className: 'video'
  events:
    'click': 'updateProjector'
    'mouseover': 'animate'
  initialize: ->
    @projector = @options.projector
  render: =>
    @$(@el).html videoTemplate @model.toJSON()
    @
  updateProjector: (event) ->
    if @model.get 'videoUrl'
      @projector.trigger 'updateVideo', @model
    else
      @projector.trigger 'updateText', @model
  animate: =>
    @$(@el).animate(
      top: '+=5px'
    , 100)
    .animate(
      top: '-=5px'
    , 100)
    .animate(
      top: '-=5px'
    , 100)
    .animate(
      top: '+=5px'
    , 100)

