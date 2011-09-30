videoTemplate = require 'templates/video'

class exports.VideoView extends Backbone.View
  className: 'video'
  events:
    'click': 'updateProjectorVideoUrl'
    'mouseover': 'animate'
  initialize: ->
    @projector = @options.projector
  render: =>
    @$(@el).html videoTemplate @model.toJSON()
    @
  updateProjectorVideoUrl: (event) ->
    @projector.set
      videoUrl: @model.get 'videoUrl'
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

