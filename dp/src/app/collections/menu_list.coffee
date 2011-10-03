{Menu} = require 'models/menu'

class exports.MenuList extends Backbone.Collection
  model: Menu
  url: "#{app.config.jsonPath}/menu_list.json"
