projectorTemplate = require 'templates/projector'
{Projector} = require 'models/projector'
{ProjectorTextView} = require 'views/projector_text_view'
{ProjectorImageView} = require 'views/projector_image_view'

class exports.ProjectorView extends Backbone.View
  id: 'projector'
  initialize: ->
    @model.bind 'change', @update
  render: =>
    @$(@el).html projectorTemplate()
    model = @model
    $projector_content = @$('#projector-content')
    _.delay ->
      $projector_content.slideDown 3000
    , 500
    _.delay ->
      model.trigger 'show', model
    , 3500
    @
  update: =>
    model = @model.get 'model'
    switch model.get 'showType'
      when "text" then @showText()
      when "image" then @showImage()
      when "video" then @showVideo()
  showVideo: =>
    model = @model.get 'model'
    $iframe = $('<iframe/>')
    $iframe.attr 'src', model.get 'videoUrl'
    $iframe.attr 'width', '100%'
    $iframe.attr 'height', '100%'
    @$('#projector-content').html $iframe
  showText: =>
    model = @model.get 'model'
    projectorTextView = new ProjectorTextView
      model: model
    $projectorTextView = $ projectorTextView.render().el
    $projectorTextView.hide()
    @$('#projector-content').html $projectorTextView
    $projectorTextView.fadeIn 2000
  showImage: =>
    model = @model.get 'model'
    projectorImageView = new ProjectorImageView
      model: model
    @$('#projector-content').html projectorImageView.render().el
    @$('#slider').nivoSlider
      effect: 'slideInLeft'
      pauseTime: 6000
      controlNav: false


