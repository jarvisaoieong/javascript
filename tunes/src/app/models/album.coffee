class exports.Album extends Backbone.Model
  isFirstTrack: (index) ->
    index == 0
  isLastTrack: (index) ->
    index >= @get('tracks').length - 1
  trackUrlAtIndex: (index) ->
    if (@get('tracks').length - 1) >= index
      @get('tracks')[index].url
    else
      null
