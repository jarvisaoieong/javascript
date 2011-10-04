projectorTemplate = require 'templates/projector'
{Projector} = require 'models/projector'
{ProjectorTextView} = require 'views/projector_text_view'

class exports.ProjectorView extends Backbone.View
  id: 'projector'
  initialize: ->
    @model.bind 'updateVideo', @showVideo
    @model.bind 'updateText', @showText
  render: =>
    @$(@el).html projectorTemplate()
    model = @model
    $projector_content = @$('#projector-content')
    _.delay ->
      $projector_content.slideDown 3000
    , 500
    _.delay ->
      model.trigger 'inited', @model
    , 3500
    @
  showVideo: (model) =>
    $iframe = $('<iframe/>')
    $iframe.attr 'src', model.get 'videoUrl'
    $iframe.attr 'width', '100%'
    $iframe.attr 'height', '100%'
    @$('#projector-content').html $iframe
  showText: (model) =>
    projectorTextView = new ProjectorTextView
      model: model
    $projectorTextView = $ projectorTextView.render().el
    $projectorTextView.hide()
    @$('#projector-content').html $projectorTextView
    $projectorTextView.fadeIn 2000
    projectorTextView.scroll()

