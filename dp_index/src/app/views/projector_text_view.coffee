projectorTextTemplate = require 'templates/projector_text'

class exports.ProjectorTextView extends Backbone.View
  id: 'projector-text'
  render: =>
    @$(@el).html projectorTextTemplate @model.toJSON()
    @
  scroll: =>
    ###
    height = @el.scrollHeight - 270
    @$(@el).animate
      marginTop: "-#{height}px"
    , height / 20 * 1000
    ###

