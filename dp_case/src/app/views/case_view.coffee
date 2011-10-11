{MapView} = require 'views/map_view'

class exports.CaseView extends Backbone.View
  initialize: ->
    @mapView = new MapView
      collection: app.collections.countryList
  render: =>
    @$(@el).html @mapView.render().el
    @
    
