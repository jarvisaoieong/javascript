{FlagView} = require 'views/flag_view'
{ElectorView} = require 'views/elector_view'

class exports.MapView extends Backbone.View
  id: 'map'
  initialize: ->
    @$(@el).css 'backgroundImage', "url(#{app.config.imgPath}/map.png)"
    @collection.bind 'reset', @addCountryList
    @electorView = new ElectorView
      model: app.models.elector
  render: =>
    @$(@el).append @electorView.render().el
    @
  addCountryList: =>
    $el = @$(@el)
    @collection.each (model) ->
      flagView = new FlagView
        model: model
      $el.append flagView.render().el
