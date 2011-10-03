projectorTemplate = require 'templates/projector'
projectorMenuTemplate = require 'templates/projector_menu'
{Projector} = require 'models/projector'

class exports.ProjectorView extends Backbone.View
  id: 'projector'
  initialize: ->
    @model.bind 'change', @showVideo
  render: =>
    $el = @$(@el)
    $el.html projectorTemplate {}
    $projector_content = @$('#projector-content')
    _.delay ->
      $projector_content.slideDown 1000
    , 500
    @
  showVideo: (model) =>
    $iframe = $('<iframe/>')
    $iframe.attr 'src', model.get 'videoUrl'
    $iframe.attr 'width', '100%'
    $iframe.attr 'height', '100%'
    $iframe.hide()
    @$('#projector-content').html $iframe
    $iframe.slideDown 1000
