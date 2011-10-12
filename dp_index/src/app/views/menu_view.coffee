menuTemplate = require 'templates/menu'

class exports.MenuView extends Backbone.View
  tagName: 'li'
  render: =>
    @$(@el).html menuTemplate @model.toJSON()
    @
