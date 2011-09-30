class exports.MainRouter extends Backbone.Router
  routes :
    "home": "home"

  home: ->
    $('body').html app.views.home.render().el
    $('nav').html app.views.menuListView.render().el
    $('#content').html app.views.contentView.render().el
