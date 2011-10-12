projectorImageTemplate = require 'templates/projector_image'

class exports.ProjectorImageView extends Backbone.View
  id: 'projector-image'
  render: =>
    @$(@el).html projectorImageTemplate @model.toJSON()
    @
