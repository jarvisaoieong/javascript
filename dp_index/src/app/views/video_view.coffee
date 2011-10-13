videoTemplate = require 'templates/video'

class exports.VideoView extends Backbone.View
  tagName: 'img'
  className: 'video'
  events:
    'click': 'updateProjector'
    'mouseover': 'animate'
  initialize: ->
    @$(@el).attr 'src', "#{app.config.imgPath}/#{@model.get 'imgUrl'}"
    @$(@el).attr 'id', @model.get 'id'
  render: =>
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

