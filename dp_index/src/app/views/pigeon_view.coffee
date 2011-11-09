class exports.PigeonView extends Backbone.View
  tagName: 'img'
  id: 'pigeon'
  events:
    'mouseover': 'mouseover'
    'mouseout': 'mouseout'
    'click': 'subscribe'
  initialize: ->
    @$(@el).attr 'src', "#{app.config.imgPath}/pigeon.png"
    #@audio = new Audio()
    #@audio.src = app.config.jsonPath + "/goo.mp3"
  render: =>
    @
  mouseover: =>
    @$(@el).attr 'src', "#{app.config.imgPath}/pigeon_hover.png"
    #@audio.play()
  mouseout: =>
    @$(@el).attr 'src', "#{app.config.imgPath}/pigeon.png"
  subscribe: =>
    app.models.projector.set
      'model': @model
