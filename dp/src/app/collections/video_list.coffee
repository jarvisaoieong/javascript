{Video} = require 'models/video'

class exports.VideoList extends Backbone.Collection
  model: Video
  url: "#{app.config.jsonPath}/video_list.json"

