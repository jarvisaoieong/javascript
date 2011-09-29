class exports.MainRouter extends Backbone.Router
  routes :
    "home": "home"
    'blank': 'blank'

  home: ->
    $('body').html app.views.home.render().el
    $container = $ '#container'
    $container.empty()
    $container.append app.views.playlistView.render().el
    $container.append app.views.libraryView.render().el
    app.collections.library.fetch()
  blank: ->
    $('body').empty()
    $('body').text('blank')
