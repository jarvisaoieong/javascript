class exports.FlagView extends Backbone.View
  tagName: 'img'
  events:
    'click': 'changeElector'
    'mouseover': 'mouseover'
    'mouseout': 'mouseout'
  initialize: ->
    @$(@el).attr 'src', "#{app.config.imgPath}/#{@model.get 'imgUrl'}"
    @$(@el).attr 'title', @model.get 'name'
    @$(@el).attr 'id', @model.get 'id'
  render: =>
    @
  changeElector: (event) =>
    app.models.elector.set
      model: @model
      event: event
  mouseover: =>
    @$(@el).attr 'src', "#{app.config.imgPath}/#{@model.get 'imgUrlHover'}"
    @$(@el).css 'z-index', 10
  mouseout: =>
    @$(@el).attr 'src', "#{app.config.imgPath}/#{@model.get 'imgUrl'}"
    @$(@el).css 'z-index', 5
