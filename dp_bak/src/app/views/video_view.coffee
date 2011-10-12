videoTemplate = require 'templates/video'

class exports.VideoView extends Backbone.View
  className: 'video'
  events:
    'click': 'updateProjector'
    'mouseover': 'animate'
  render: =>
    @$(@el).html videoTemplate @model.toJSON()
    @
  updateProjector: (event) ->
    app.models.projector.set
      model: @model
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

