class exports.MainRouter extends Backbone.Router
  routes :
    "home": "home"
    "case": "case"

  home: ->
    #$('body').html app.views.home.render().el
    #$('nav').html app.views.menuListView.render().el
    $('#content').html app.views.indexView.render().el

  case: ->
    $('#content').html app.views.caseView.render().el

