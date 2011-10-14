electorTemplate = require 'templates/elector'

class exports.ElectorView extends Backbone.View
  id: 'elector'
  events:
    'click .close': 'close'
  initialize: ->
    @model.bind 'change', @render
  render: =>
    $el = @$(@el)
    $el.hide()
    model = @model.get 'model'
    event = @model.get 'event'
    if model
      $el.html electorTemplate model.toJSON()
      parentWidth = event.currentTarget.offsetParent.offsetWidth
      parentHeight = event.currentTarget.offsetParent.offsetHeight
      currentTop = event.currentTarget.offsetTop
      currentLeft = event.currentTarget.offsetLeft
      if currentLeft < parentWidth * 1 /3
        left = currentLeft + 70
      else if parentWidth / 3 < currentLeft < parentWidth * 2 / 3
        left = currentLeft + 50
      else
        left = currentLeft - 250
      if currentTop > parentHeight * 2 / 3
        top = currentTop - 50
      else
        top = currentTop
      $el.css 'top', top
      $el.css 'left', left
      $el.fadeIn()
    @
  close: =>
    @$(@el).fadeOut()
