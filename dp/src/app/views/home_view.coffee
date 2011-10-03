homeTemplate = require('templates/home')

class exports.HomeView extends Backbone.View
  id: 'home-view'

  render: ->
    $('body').css 'backgroundImage', "url(#{app.config.imgPath}/bg.jpg)"
    $(@el).html homeTemplate()
    @
