projectorTemplate = require 'templates/projector'
projectorMenuTemplate = require 'templates/projector_menu'
{Projector} = require 'models/projector'

class exports.ProjectorView extends Backbone.View
  id: 'projector'
  initialize: ->
    @model.bind 'change', @showVideo
  render: =>
    @$(@el).html projectorTemplate {}
    @
  showVideo: (model) =>
    $iframe = $('<iframe/>')
    $iframe.attr 'src', model.get 'videoUrl'
    $iframe.attr 'width', '100%'
    $iframe.attr 'height', '100%'
    $iframe.hide()
    @$('#projector-content').html $iframe
    $iframe.slideDown 1000
  showProjector: =>
    #    @$(@el).css 'backgroundImage', '/img/projector.png'
    console.dir @$(@el)
