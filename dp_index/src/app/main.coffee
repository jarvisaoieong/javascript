window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}
app.config = {}

app.config.imgPath = imgPath
app.config.jsonPath = jsonPath

MainRouter = require('routers/main_router').MainRouter
HomeView = require('views/home_view').HomeView

{Projector} = require 'models/projector'

{MenuList} = require 'collections/menu_list'
{VideoList} = require 'collections/video_list'

{IndexView} = require 'views/index_view'

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.routers.main = new MainRouter()

    app.models.projector = new Projector()

    app.collections.menuList = new MenuList()
    app.collections.videoList = new VideoList()

    ###
    app.views.home = new HomeView()
    app.views.menuListView = new MenuListView
      collection: app.collections.menuList
    ###
    app.views.indexView = new IndexView()
    
    #app.collections.menuList.fetch()
    app.collections.videoList.fetch()

    app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''
  app.initialize()
  $('body').css 'backgroundImage', "url(#{app.config.imgPath}/bg.jpg)"
  Backbone.history.start()
