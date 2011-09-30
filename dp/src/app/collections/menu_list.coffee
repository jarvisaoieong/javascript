{Menu} = require 'models/menu'

class exports.MenuList extends Backbone.Collection
  model: Menu
  url: 'menu_list.json'
