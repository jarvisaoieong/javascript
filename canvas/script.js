(function() {
  var App, Canvas, app;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  Canvas = (function() {
    function Canvas() {
      this.canvas.height = 400;
      this.canvas.width = 800;
      this.ctx = this.canvas.getContext('2d');
      this.ctx.fillStype = 'solid';
      this.ctx.strokeStyle = '#bada55';
      this.ctx.lineWidth = 5;
      this.ctx.lineCap = 'round';
    }
    Canvas.prototype.canvas = document.createElement('canvas');
    return Canvas;
  })();
  App = (function() {
    function App() {
      $('body').append(this.canvas.canvas);
      this.socket.on('draw', __bind(function(data) {
        return this.draw(data.x, data.y, data.type);
      }, this));
    }
    App.prototype.canvas = new Canvas();
    App.prototype.socket = io.connect('http://localhost:4000');
    App.prototype.draw = function(x, y, type) {
      var ctx;
      ctx = this.canvas.ctx;
      if (type === 'dragstart') {
        ctx.beginPath();
        return ctx.moveTo(x, y);
      } else if (type === 'drag') {
        ctx.lineTo(x, y);
        return ctx.stroke();
      } else {
        return ctx.closePath();
      }
    };
    return App;
  })();
  app = new App();
  $('canvas').live('drag dragstart dragend', function(e) {
    var offset, type, x, y;
    type = e.handleObj.type;
    offset = $(this).offset();
    x = e.layerX - offset.left;
    y = e.layerY - offset.top;
    app.draw(x, y, type);
    return app.socket.emit('drawClick', {
      x: x,
      y: y,
      type: type
    });
  });
}).call(this);
