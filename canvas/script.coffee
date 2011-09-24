class Canvas
  constructor: ->
    @canvas.height = 400
    @canvas.width = 800
    @ctx = @canvas.getContext '2d'
    @ctx.fillStype = 'solid'
    @ctx.strokeStyle = '#bada55'
    @ctx.lineWidth = 5
    @ctx.lineCap = 'round'
  canvas: document.createElement 'canvas'
  
class App
  constructor: ->
    $('body').append @canvas.canvas
    @socket.on 'draw', (data) =>
      @draw data.x, data.y, data.type
  canvas: new Canvas()
  socket: io.connect 'http://localhost:4000'
  draw: (x,y,type) ->
    ctx = @canvas.ctx
    if type is 'dragstart'
      ctx.beginPath()
      ctx.moveTo x,y
    else if type is 'drag'
      ctx.lineTo x,y
      ctx.stroke()
    else
      ctx.closePath()

app = new App()

$('canvas').live 'drag dragstart dragend', (e) ->
  type = e.handleObj.type
  offset = $(@).offset()

  x = e.layerX - offset.left
  y = e.layerY - offset.top
  app.draw x, y, type
  app.socket.emit 'drawClick',
    x: x
    y: y
    type: type

