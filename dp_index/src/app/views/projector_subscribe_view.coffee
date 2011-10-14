projectorSubscribeTemplate = require 'templates/projector_subscribe'

class exports.ProjectorSubscribeView extends Backbone.View
  id: 'projector-subscribe'
  events:
    'click #subscribe-submit': 'submit'
  render: =>
    @$(@el).html projectorSubscribeTemplate @model.toJSON()
    @
  submit: =>
    $result = @$('#subscribe-result')
    $result.hide()
    $result.html @model.get 'result'
    $result.fadeIn 1000
    email = @$('#email').val()
    $.ajax
      type: 'get'
      dataType: 'jsonp'
      url: 'http://202.175.83.251/ers_api/index.php/transmitter/dp/email/format/jsonp'
      data:
        email: email
      success: ->
        console.log 'subscribe success'
