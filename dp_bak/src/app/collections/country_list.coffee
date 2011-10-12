{Country} = require 'models/country'

class exports.CountryList extends Backbone.Collection
  model: Country
  url: "#{app.config.jsonPath}/country_list.json"
