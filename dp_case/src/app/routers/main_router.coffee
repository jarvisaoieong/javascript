class exports.MainRouter extends Backbone.Router
  routes :
    "case": "case"
  case: ->
    $('#content').html app.views.caseView.render().el

