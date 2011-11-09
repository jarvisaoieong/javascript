express = require 'express'
products = require './products'

app = express.createServer()

app.configure ->
  app.use express.logger()
  app.use express.static __dirname + '/static'

app.configure 'development', ->
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.configure 'production', ->
  app.use express.errorHandler()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'root'

app.get '/products', (req, res) ->
  res.render 'products/index',
    locals:
      products: products.all

app.get '/products/:id', (req, res) ->
  product = products.find req.params.id
  res.render 'products/show',
    locals:
      product: product
app.listen 4000
