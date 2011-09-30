menuListTemplate = require 'templates/menu_list'
{MenuList} = require 'collections/menu_list'
{MenuView} = require 'views/menu_view'

class exports.MenuListView extends Backbone.View
  tagName: 'ul'
  initialize: ->
    @collection.bind 'reset', @render
  render: =>
    $el = @$(@el)
    $el.empty()
    @collection.each (model) ->
      menuView = new MenuView
        model: model
      $el.append menuView.render().el
    $el.append menuListTemplate {}
    @
