window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}
app.config = {}

app.config.imgPath = imgPath
app.config.jsonPath = jsonPath

MainRouter = require('routers/main_router').MainRouter

{Elector} = require 'models/elector'

{CountryList} = require 'collections/country_list'

{CaseView} = require 'views/case_view'

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()

    app.models.elector = new Elector()

    app.collections.countryList = new CountryList()

    app.views.caseView = new CaseView()
    
    app.collections.countryList.fetch()

    $('#content').html app.views.caseView.render().el
    #app.routers.main.navigate 'case', true if Backbone.history.getFragment() is ''
  app.initialize()
  $('body').css 'backgroundImage', "url(#{app.config.imgPath}/bg.jpg)"
  #Backbone.history.start()
