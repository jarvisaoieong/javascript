{Video} = require 'models/video'

class exports.VideoList extends Backbone.Collection
  model: Video
  url: 'video_list.json'

